<template>
    <div class="index-lists">
        <el-card class="!border-none" shadow="never">
            <el-form ref="formRef" class="mb-[-16px]" :model="queryParams" :inline="true">
                <el-form-item label="数据集名称" prop="dataset_name">
                    <el-input class="w-[280px]" v-model.trim="queryParams.dataset_name" />
                </el-form-item>
                <el-form-item label="数据集类型" prop="dataset_type">
                    <el-select v-model="queryParams.dataset_type" class="w-[280px]" clearable>
                        <el-option
                            v-for="(item, index) in selectOptions"
                            :key="index"
                            :label="item.label"
                            :value="item.value"
                        />
                    </el-select>
                </el-form-item>
                <el-form-item label="数据集来源" prop="dataset_source">
                    <el-input class="w-[280px]" v-model.trim="queryParams.dataset_source" />
                </el-form-item>
                <el-form-item label="数据集大小" prop="size">
                    <el-input class="w-[280px]" v-model.trim="queryParams.size" />
                </el-form-item>
                <el-form-item label="文件路径" prop="filepath">
                    <el-input class="w-[280px]" v-model.trim="queryParams.filepath" />
                </el-form-item>
                <el-form-item label="数据集描述" prop="description">
                    <el-input class="w-[280px]" v-model.trim="queryParams.description" />
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="resetPage">查询</el-button>
                    <el-button @click="resetParams">重置</el-button>
                </el-form-item>
            </el-form>
        </el-card>
        <el-card class="!border-none mt-4" shadow="never">
            <div>
                <el-button v-perms="['collection:add']" type="primary" @click="handleAdd()">
                    <template #icon>
                        <icon name="el-icon-Plus" />
                    </template>
                    新增
                </el-button>
                <el-button
                    :disabled="multipleSelection.length == 0"
                    v-perms="['collection:add']"
                    type="primary"
                    @click="handleBatchDelete()"
                >
                    <template #icon>
                        <icon name="el-icon-delete" />
                    </template>
                    删除
                </el-button>
            </div>
            <el-table
                class="mt-4"
                size="large"
                v-loading="pager.loading"
                :data="pager.lists"
                @selection-change="handleSelectionChange"
            >
                <el-table-column type="selection" min-width="30" />
                <el-table-column label="数据集名称" prop="dataset_name" min-width="100" />
                <el-table-column label="数据集类型" prop="dataset_type" min-width="80">
                    <template #default="{ row }">
                        <el-tag v-if="row.dataset_type === 0" type="success">代码</el-tag>
                        <el-tag v-else-if="row.dataset_type === 1" type="warning">文档</el-tag>
                    </template>
                </el-table-column>
                <el-table-column label="数据集来源" prop="dataset_source" min-width="100" />
                <el-table-column label="数据集大小" prop="size" min-width="80" />
                <el-table-column label="文件路径" prop="filepath" min-width="100" />
                <el-table-column label="数据集描述" prop="description" min-width="150" />
                <el-table-column label="创建时间" prop="create_time" min-width="80" />
                <el-table-column label="更新时间" prop="update_time" min-width="80" />
                <el-table-column label="操作" width="120" fixed="right">
                    <template #default="{ row }">
                        <el-button
                            v-perms="['collection:edit']"
                            type="primary"
                            link
                            @click="handleEdit(row)"
                        >
                            编辑
                        </el-button>
                        <el-button
                            v-perms="['collection:del']"
                            type="danger"
                            link
                            @click="handleDelete(row.id)"
                        >
                            删除
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div class="flex justify-end mt-4">
                <pagination v-model="pager" @change="getLists" />
            </div>
        </el-card>
        <edit-popup v-if="showEdit" ref="editRef" @success="getLists" @close="showEdit = false" />
    </div>
</template>
<script lang="ts" setup name="collection">
import { h } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { collectionDelete, collectionLists, collectionBatchDelete } from '@/api/collection'
import { usePaging } from '@/hooks/usePaging'
import feedback from '@/utils/feedback'
import EditPopup from './edit.vue'
const selectOptions = [
    {
        label: '代码',
        value: 0
    },
    {
        label: '文档',
        value: 1
    }
]
const multipleSelection: any = ref([])
const editRef = shallowRef<InstanceType<typeof EditPopup>>()
const showEdit = ref(false)
const queryParams = reactive({
    dataset_name: null,
    dataset_type: null,
    dataset_source: null,
    size: null,
    filepath: null,
    description: null
})

const { pager, getLists, resetPage, resetParams } = usePaging({
    fetchFun: collectionLists,
    params: queryParams
})

const handleAdd = async () => {
    showEdit.value = true
    await nextTick()
    editRef.value?.open('add')
}

const handleEdit = async (data: any) => {
    showEdit.value = true
    await nextTick()
    editRef.value?.open('edit')
    editRef.value?.getDetail(data)
}

const handleDelete = async (id: number) => {
    await feedback.confirm('确定要删除？')
    await collectionBatchDelete([id])
    feedback.msgSuccess('删除成功')
    getLists()
    // await collectionDelete({ id })
}

const handleSelectionChange = (val: any[]) => {
    multipleSelection.value = val
}

const handleBatchDelete = () => {
    const delSelectionIds = multipleSelection.value.map((item: any) => item.id)
    console.log(delSelectionIds)
    ElMessageBox({
        title: '删除记录',
        message: h('p', null, [
            h('span', null, '确定删除'),
            h('i', { style: 'color: teal' }, ` ${delSelectionIds.length} `),
            h('span', null, '条记录？')
        ]),
        showCancelButton: true,
        confirmButtonText: '确定',
        cancelButtonText: '算了',
        beforeClose: (action, instance, done) => {
            if (action === 'confirm') {
                instance.confirmButtonLoading = true
                instance.confirmButtonText = 'Loading...'
                setTimeout(() => {
                    done()
                    setTimeout(() => {
                        instance.confirmButtonLoading = false
                    }, 300)
                }, 1000)
            } else {
                done()
            }
        }
    }).then(async (action) => {
        await collectionBatchDelete(delSelectionIds)
        ElMessage({
            type: 'info',
            message: `删除了${delSelectionIds.length}条记录`
        })
        getLists()
    })
}

getLists()
</script>
