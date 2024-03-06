import request from '@/utils/request'

// 【请填写功能名称】列表
export function collectionLists(params?: Record<string, any>) {
    return request.get({ url: '/dataset/collection/list', params })
}

// 【请填写功能名称】详情
export function collectionDetail(params: Record<string, any>) {
    return request.get({ url: '/dataset/collection/detail', params })
}

// 【请填写功能名称】新增
export function collectionAdd(params: Record<string, any>) {
    return request.post({ url: '/dataset/collection/add', params })
}

// 【请填写功能名称】编辑
export function collectionEdit(params: Record<string, any>) {
    return request.post({ url: '/dataset/collection/edit', params })
}

// 【请填写功能名称】删除
export function collectionDelete(params: Record<string, any>) {
    return request.post({ url: '/dataset/collection/del', params })
}

export function collectionBatchDelete(params: Record<string, any>) {
    return request.post({ url: '/dataset/collection/batchdel', params })
}
