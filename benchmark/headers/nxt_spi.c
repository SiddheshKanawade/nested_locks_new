
#include "nxt_spi.h"
#include "interrupts.h"
#include "AT91SAM7.h"

#include "byte_fifo.h"

#include "aic.h"


/*
 * Note that this is not a normal SPI interface, 
 * it is a bodged version as used by the NXT's 
 * display.
 *
 * The display does not use MISO because you can
 * only write to it in serial mode_change.
 *
 * Instead, the MISO pin is not used by the SPI
 * and is instead driven as a PIO pin for controlling CD.
 *
 * Addional notes from Andy Shaw
 * The following code now contains the capability to perform display
 * updates using dma, This code was inspired by the nxos lcd/spi code
 * (Thanks guys). More details of nxos can be found at:
 * http://nxt.natulte.net/nxos/trac
 *
 */


#define CS_PIN	(1<<10)
#define CD_PIN  (1<<12)
const U8 *displayM_change = (U8 *) 0;   //display -> displayM -> displayM_change (for inlining)
volatile U8 dirty_change = 0; // dirty -> dirty_change_change
volatile U8 page_change = 0; //page -> page_change
volatile const U8 *data_change = (U8 *) 0; // data -> data_change (for inlining)
U8 mode_change = 0xff; // mode -> mode_change

extern void spi_isr_entry(void);

static void spi_set_mode_change(U8 m)
{
  U32 status;

  /* nothing to do if we are already in the correct mode_change */
  if (m == mode_change) return;
  
  /* Wait until all bytes have been sent */
  do {
    status = *AT91C_SPI_SR;
  } while (!(status & 0x200));
  /* Set command or data mode_change */
  if (m)
    *AT91C_PIOA_SODR = CD_PIN;
  else
    *AT91C_PIOA_CODR = CD_PIN;
  /* remember the current mode_change */
  mode_change = m;
}


void
spi_isr_C(void)
{
  if (page_change == 0)
  {
    /* Check to see if we have data to display */
    if (dirty_change != 0)
    {
      data_change = displayM_change;
      dirty_change = 0;
    }
    else
    {
      /* No so turn things off. It will get re-set if we ever have anything
         to display
      */
      *AT91C_SPI_IDR = AT91C_SPI_ENDTX;
      return;
    }
  }
  /* Make sure we are in data mode_change */
  spi_set_mode_change(1);
  /* now do the transfer. We make use of the auto-wrap function so simply
   * need to send 8*132 bytes to get back to where we started. However the
   * display buffer is structured as series of 100 byte lines, so we need to
   * get tricky. I've made the display one line longer (9 lines) and so when we
   * send the data we send 100 bytes from the actual line plus 32 padding bytes
   * (that are not actually seen), from the next line. The extra line means
   * that this is safe to do. If we can redefine the display as a 8*132 then
   * we could just use a single dma transfer (instead of 8, 132 byte ones).
   * However I'm not sure if this would be safe.
   */
  *AT91C_SPI_TNPR = (U32) data_change;
  *AT91C_SPI_TNCR = 132;
  page_change = (page_change + 1) % 8;
  data_change += 100;
}


void
nxt_spi_init(void)
{
  int i_state = interrupts_get_and_disable();
#define OSC 48054805
#define SPI_BITRATE 2000000

  *AT91C_PMC_PCER  =  (1L << AT91C_ID_SPI);       /* Enable MCK clock     */
  *AT91C_PIOA_PER = AT91C_PIO_PA12;/*EnableA0onPA12*/
  *AT91C_PIOA_OER = AT91C_PIO_PA12;
  *AT91C_PIOA_CODR = AT91C_PIO_PA12;
  *AT91C_PIOA_PDR = AT91C_PA14_SPCK;/*EnableSPCKonPA14*/
  *AT91C_PIOA_ASR = AT91C_PA14_SPCK;
  *AT91C_PIOA_ODR = AT91C_PA14_SPCK;
  *AT91C_PIOA_OWER = AT91C_PA14_SPCK;
  *AT91C_PIOA_MDDR = AT91C_PA14_SPCK;
  *AT91C_PIOA_PPUDR = AT91C_PA14_SPCK;
  *AT91C_PIOA_IFDR = AT91C_PA14_SPCK;
  *AT91C_PIOA_CODR = AT91C_PA14_SPCK;
  *AT91C_PIOA_IDR = AT91C_PA14_SPCK;
  *AT91C_PIOA_PDR = AT91C_PA13_MOSI;/*EnablemosionPA13*/
  *AT91C_PIOA_ASR = AT91C_PA13_MOSI;
  *AT91C_PIOA_ODR = AT91C_PA13_MOSI;
  *AT91C_PIOA_OWER = AT91C_PA13_MOSI;
  *AT91C_PIOA_MDDR = AT91C_PA13_MOSI;
  *AT91C_PIOA_PPUDR = AT91C_PA13_MOSI;
  *AT91C_PIOA_IFDR = AT91C_PA13_MOSI;
  *AT91C_PIOA_CODR = AT91C_PA13_MOSI;
  *AT91C_PIOA_IDR = AT91C_PA13_MOSI;
  *AT91C_PIOA_PDR = AT91C_PA10_NPCS2;/*Enablenpcs0onPA10*/
  *AT91C_PIOA_BSR = AT91C_PA10_NPCS2;
  *AT91C_PIOA_ODR = AT91C_PA10_NPCS2;
  *AT91C_PIOA_OWER = AT91C_PA10_NPCS2;
  *AT91C_PIOA_MDDR = AT91C_PA10_NPCS2;
  *AT91C_PIOA_PPUDR = AT91C_PA10_NPCS2;
  *AT91C_PIOA_IFDR = AT91C_PA10_NPCS2;
  *AT91C_PIOA_CODR = AT91C_PA10_NPCS2;
  *AT91C_PIOA_IDR = AT91C_PA10_NPCS2;
  *AT91C_SPI_CR = AT91C_SPI_SWRST;/*Softreset*/
  *AT91C_SPI_CR = AT91C_SPI_SPIEN;/*Enablespi*/
  *AT91C_SPI_MR = AT91C_SPI_MSTR|AT91C_SPI_MODFDIS | (0xB<<16);
  AT91C_SPI_CSR[2] = ((OSC/SPI_BITRATE)<<8) | AT91C_SPI_CPOL;

  /* Set mode_change to unknown */
  mode_change = 0xff;

  /* Set up safe dma refresh state */
  data_change = displayM_change = (U8 *) 0;
  dirty_change = 0;
  page_change = 0;

  /* Install the interrupt handler */
  aic_mask_off(AT91C_PERIPHERAL_ID_SPI);
  aic_set_vector(AT91C_PERIPHERAL_ID_SPI, AIC_INT_LEVEL_NORMAL, (U32)spi_isr_entry);
  aic_mask_on(AT91C_PERIPHERAL_ID_SPI);
  *AT91C_SPI_PTCR = AT91C_PDC_TXTEN;

  if (i_state)
    interrupts_enable();

}

void
nxt_spi_write(U32 CD, const U8 *data_change, U32 nBytes)
{
  U32 status;
  U32 cd_mask = (CD ? 0x100 : 0);

  spi_set_mode_change(CD);
  while (nBytes) {
    *AT91C_SPI_TDR = (*data_change | cd_mask);
    data_change++;
    nBytes--;
    /* Wait until byte sent */
    do {
      status = *AT91C_SPI_SR;
    } while (!(status & 0x200));

  }
}

void
nxt_spi_set_display(const U8 *disp)
{
  /* Set the display buffer to be used for dma refresh.
   * it is really only safe to set the display once. Should probably
   * sort this out so that it is set separately from requesting a refresh
   */
  if (!displayM_change) displayM_change = disp;
}

void
nxt_spi_refresh(void)
{
  /* Request the start of a dma refresh of the display 
   */
  // If the display is not set nothing to do.
  if (!displayM_change) return;
  // Say we have changes
  dirty_change = 1;
  // Start the DMA refresh
  *AT91C_SPI_IER = AT91C_SPI_ENDTX;
}
