import request from '@/utils/request'

// 【请填写功能名称】列表
export function finetunedLists(params?: Record<string, any>) {
    return request.get({ url: '/finetuned/list', params })
}

// 【请填写功能名称】详情
export function finetunedDetail(params: Record<string, any>) {
    return request.get({ url: '/finetuned/detail', params })
}

// 【请填写功能名称】新增
export function finetunedAdd(params: Record<string, any>) {
    return request.post({ url: '/finetuned/add', params })
}

// 【请填写功能名称】编辑
export function finetunedEdit(params: Record<string, any>) {
    return request.post({ url: '/finetuned/edit', params })
}

// 【请填写功能名称】删除
export function finetunedDelete(params: Record<string, any>) {
    return request.post({ url: '/finetuned/del', params })
}

export function finetunedBatchDelete(params: Record<string, any>) {
    return request.post({ url: '/finetuned/batchdel', params })
}

// 指令列表
export function directivesLists(params?: Record<string, any>) {
    return request.get({ url: '/finetuned/directives/list', params })
}

// 【请填写功能名称】详情
export function directivesDetail(params: Record<string, any>) {
    return request.get({ url: '/finetuned/directives/detail', params })
}

// 【请填写功能名称】新增
export function directivesAdd(params: Record<string, any>) {
    return request.post({ url: '/finetuned/directives/add', params })
}

// 【请填写功能名称】编辑
export function directivesEdit(params: Record<string, any>) {
    return request.post({ url: '/finetuned/directives/edit', params })
}

// 【请填写功能名称】删除
export function directivesDelete(params: Record<string, any>) {
    return request.post({ url: '/finetuned/directives/batchdel', params })
}
