<template>
    <div class="index-lists">
        <el-card class="!border-none" shadow="never">
            <el-form ref="formRef" class="mb-[-16px]" :model="queryParams" :inline="true">
                <el-form-item label="指令名称" prop="instruction">
                    <el-input class="w-[280px]" v-model.trim="queryParams.instruction" />
                </el-form-item>
                <el-form-item label="指令输入" prop="input">
                    <el-input class="w-[280px]" v-model.trim="queryParams.input" />
                </el-form-item>
                <el-form-item label="指令输出" prop="size">
                    <el-input class="w-[280px]" v-model.trim="queryParams.output" />
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
                <el-table-column
                    label="指令名称"
                    prop="instruction"
                    show-overflow-tooltip
                    min-width="150"
                />
                <el-table-column
                    label="指令输入"
                    prop="input"
                    show-overflow-tooltip
                    min-width="180"
                />
                <el-table-column
                    label="指令输出"
                    prop="output"
                    show-overflow-tooltip
                    min-width="180"
                />
                <el-table-column label="历史对话" prop="history" min-width="100">
                    <template #default="{ row }">
                        <el-button
                            v-perms="['collection:preview']"
                            type="success"
                            link
                            @click="handlePreview(row)"
                        >
                            查看
                        </el-button>
                    </template>
                </el-table-column>
                <el-table-column label="创建时间" prop="create_time" min-width="80" />
                <el-table-column label="更新时间" prop="update_time" min-width="80" />
                <el-table-column label="操作" width="180" fixed="right">
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
        <preview-popup
            v-if="showPreview"
            ref="previewRef"
            @success="getLists"
            @close="showPreview = false"
        />
    </div>
</template>
<script lang="ts" setup name="collection">
import { h } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { directivesLists, directivesDelete } from '@/api/finetuned'
import { usePaging } from '@/hooks/usePaging'
import feedback from '@/utils/feedback'
import EditPopup from './component/edit.vue'
import PreviewPopup from './component/preview.vue'
import { useRouter } from 'vue-router'
const router = useRouter()
const fid = router.currentRoute.value.query.fid

const multipleSelection: any = ref([])
const editRef = shallowRef<InstanceType<typeof EditPopup>>()
const previewRef = shallowRef<InstanceType<typeof PreviewPopup>>()
const showEdit = ref(false)
const showPreview = ref(false)
const queryParams = reactive({
    fid,
    instruction: null,
    input: null,
    output: null
})

const { pager, getLists, resetPage, resetParams } = usePaging({
    fetchFun: directivesLists,
    params: queryParams
})

const handleAdd = async () => {
    showEdit.value = true
    await nextTick()
    editRef.value?.open('add')
    editRef.value?.setFid(fid)
}

const handleEdit = async (data: any) => {
    showEdit.value = true
    await nextTick()
    editRef.value?.open('edit')
    editRef.value?.getDetail(data)
}
const handlePreview = async (data: any) => {
    showPreview.value = true
    await nextTick()
    previewRef.value?.open('preview')
    previewRef.value?.getData(data)
}

const handleDelete = async (id: number) => {
    await feedback.confirm('确定要删除？')
    await directivesDelete([id])
    feedback.msgSuccess('删除成功')
    getLists()
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
        await directivesDelete(delSelectionIds)
        ElMessage({
            type: 'info',
            message: `删除了${delSelectionIds.length}条记录`
        })
        getLists()
    })
}

getLists()
</script>
./edit.vue
