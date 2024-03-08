<template>
    <div class="edit-popup">
        <popup
            ref="popupRef"
            :title="popupTitle"
            :async="true"
            width="550px"
            :clickModalClose="true"
            @confirm="handleSubmit"
            @close="handleClose"
        >
            <el-form ref="formRef" :model="formData" label-width="94px" :rules="formRules">
                <el-form-item label="数据集名称" prop="dataset_name">
                    <el-input v-model="formData.dataset_name" placeholder="请输入数据集名称" />
                </el-form-item>
                <el-form-item label="数据集类型" prop="dataset_type">
                    <el-radio-group v-model="formData.dataset_type">
                        <el-radio :label="0" size="large" border>代码</el-radio>
                        <el-radio :label="1" size="large" border>文档</el-radio>
                    </el-radio-group>
                </el-form-item>
                <el-form-item label="数据集来源" prop="dataset_source">
                    <el-input v-model="formData.dataset_source" placeholder="请输入数据集来源" />
                </el-form-item>
                <el-form-item label="数据集大小" prop="size">
                    <el-input v-model="formData.size" placeholder="请输入数据集大小" />
                </el-form-item>
                <el-form-item label="文件路径" prop="filepath">
                    <el-input v-model="formData.filepath" placeholder="请输入文件路径" />
                </el-form-item>
                <el-form-item label="数据集描述" prop="description">
                    <el-input
                        type="textarea"
                        :autosize="{ minRows: 4, maxRows: 9 }"
                        v-model="formData.description"
                        show-word-limit
                        maxlength="1500"
                        placeholder="请输入数据集描述"
                    />
                </el-form-item>
            </el-form>
        </popup>
    </div>
</template>
<script lang="ts" setup>
import type { FormInstance } from 'element-plus'
import { collectionEdit, collectionAdd, collectionDetail } from '@/api/collection'
import Popup from '@/components/popup/index.vue'
import feedback from '@/utils/feedback'
import type { PropType } from 'vue'
defineProps({
    dictData: {
        type: Object as PropType<Record<string, any[]>>,
        default: () => ({})
    }
})
const emit = defineEmits(['success', 'close'])
const formRef = shallowRef<FormInstance>()
const popupRef = shallowRef<InstanceType<typeof Popup>>()
const mode = ref('add')
const popupTitle = computed(() => {
    return mode.value == 'edit' ? '编辑数据集' : '新增数据集'
})
const formData = reactive({
    id: '',
    dataset_name: '',
    dataset_type: 0,
    dataset_source: '',
    size: '',
    filepath: '',
    description: '',
    create_time: ''
})

const formRules = {
    id: [
        {
            required: true,
            message: '请输入',
            trigger: ['blur']
        }
    ],
    dataset_name: [
        {
            required: true,
            message: '请输入数据集名称',
            trigger: ['blur']
        }
    ],
    dataset_type: [
        {
            required: true,
            message: '请选择数据集类型(0:代码，1:文档)',
            trigger: ['blur']
        }
    ],
    dataset_source: [
        {
            required: true,
            message: '请输入数据集来源',
            trigger: ['blur']
        }
    ],
    size: [
        {
            required: true,
            message: '请输入数据集大小',
            trigger: ['blur']
        }
    ],
    filepath: [
        {
            required: true,
            message: '请输入文件路径',
            trigger: ['blur']
        }
    ],
    description: [
        {
            required: true,
            message: '请输入数据集描述',
            trigger: ['blur']
        }
    ]
}

const handleSubmit = async () => {
    await formRef.value?.validate()
    const data: any = { ...formData }
    mode.value == 'edit' ? await collectionEdit(data) : await collectionAdd(data)
    popupRef.value?.close()
    feedback.msgSuccess('操作成功')
    emit('success')
}

const open = (type = 'add') => {
    mode.value = type
    popupRef.value?.open()
}

const setFormData = async (data: Record<string, any>) => {
    for (const key in formData) {
        if (data[key] != null && data[key] != undefined) {
            //@ts-ignore
            formData[key] = data[key]
        }
    }
}

const getDetail = async (row: Record<string, any>) => {
    const data = await collectionDetail({
        id: row.id
    })
    setFormData(data)
}

const handleClose = () => {
    emit('close')
}

defineExpose({
    open,
    setFormData,
    getDetail
})
</script>
