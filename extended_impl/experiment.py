
lock_list = []

def add_task_locks(task_lock_list, task, block_list):
    # Append all the locks corresponding to this task in the task_lock_list
    for blk in block_list:
        if blk.task_name==task.name:
            task_lock_list.append(blk)

def get_task_locks_list_high_priority(tk, task_list, block_list):
    task_lock_list=[]
    for task in task_list:
        if task.priority >= tk.priority:
            add_task_locks(task_lock_list, task, block_list)
    
    return task_lock_list



def isSat_eqn7(li, tsk, tasklist, blkList):
    lower = list(filter(lambda x: x['pr'] < tsk['priority'], blk_response_time))
    low_blks_rt = list(map(lambda x: x['c'], blk_response_time))
    higher = list(filter(lambda x: x['priority'] > tsk['priority'], tasklist))
    
    new_li = tsk['wcet'] + foreachlock(tsk, blkList, uniquelocks, 0.0) + interference2(li, higher)  # Check
    
    if equalsf(li, new_li):
        return True
    else:
        schedulable = 0
        return False

