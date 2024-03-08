<template>
    <div class="edit-popup">
        <popup
            ref="popupRef"
            :title="popupTitle"
            :async="true"
            width="900px"
            :clickModalClose="true"
            @confirm="handleSubmit"
            @close="handleClose"
        >
            <el-form ref="formRef" :model="formData" label-width="94px" :rules="formRules">
                <el-row :gutter="20">
                    <el-col :span="8">
                        <el-form-item v-show="mode == 'edit'" prop="instruction">
                            <div class="tag-title">隶属数据集：</div>
                            <el-input v-model="formData.fid" placeholder="请输入数据集id" />
                        </el-form-item>
                        <el-form-item prop="instruction">
                            <div class="tag-title">指令名称：</div>
                            <el-input
                                type="textarea"
                                :autosize="{ minRows: 3, maxRows: 4 }"
                                v-model="formData.instruction"
                                placeholder="请输入指令名称"
                            />
                        </el-form-item>
                        <el-form-item prop="input">
                            <div class="tag-title">输入：</div>
                            <el-input
                                type="textarea"
                                :autosize="{ minRows: 5, maxRows: 6 }"
                                v-model="formData.input"
                                placeholder="请输入场景"
                            />
                        </el-form-item>
                        <el-form-item prop="dataset_source">
                            <div class="tag-title">输出：</div>
                            <el-input
                                type="textarea"
                                :autosize="{ minRows: 6, maxRows: 7 }"
                                v-model="formData.output"
                                placeholder="请输入输出"
                            />
                        </el-form-item>
                    </el-col>
                    <el-col :span="15" :offset="1">
                        <div size="large" class="tag-title">历史对话：</div>
                        <codemirror
                            v-model="formData.history"
                            placeholder="请输入历史对话(jsonarray二维数组格式)"
                            :style="{ height: '500px', width: '450px' }"
                            :autofocus="true"
                            :indent-with-tab="true"
                            :lineWrapping="true"
                            :foldGutter="true"
                            :tabSize="4"
                            :scrollbarStyle="null"
                            mode="application/json"
                        />
                    </el-col>
                </el-row>
            </el-form>
        </popup>
    </div>
</template>
<script lang="ts" setup>
import { Codemirror } from 'vue-codemirror'
import type { FormInstance } from 'element-plus'
import { directivesAdd, directivesEdit, directivesDetail } from '@/api/finetuned'
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
    return mode.value == 'edit' ? '编辑指令' : '新增指令'
})
const formData = reactive({
    id: '',
    fid: '',
    instruction: '',
    input: '',
    output: '',
    history: ''
})

const formRules = {
    instruction: [
        {
            required: true,
            message: '请输入指令名称',
            trigger: ['blur']
        }
    ],
    input: [
        {
            required: true,
            message: '请输入指令场景',
            trigger: ['blur']
        }
    ],
    output: [
        {
            required: true,
            message: '请输入输出',
            trigger: ['blur']
        }
    ]
}

const getDetail = async (row: Record<string, any>) => {
    const data = await directivesDetail({
        id: row.id
    })
    setFormData(data)
}

const setFid = (row: Record<string, any>) => {
    if (row) {
        console.log('sssssss')
        console.log('fid', row)
        formData.fid = row
    }
}

const handleSubmit = async () => {
    await formRef.value?.validate()
    const data: any = { ...formData }
    mode.value == 'edit' ? await directivesEdit(data) : await directivesAdd(data)
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
    formData['history'] = JSON.stringify(JSON.parse(formData['history']), null, 4)
}

const handleClose = () => {
    emit('close')
}

defineExpose({
    open,
    setFormData,
    getDetail,
    setFid
})
</script>
<style>
.tag-title {
    margin-bottom: 7px;
    font-size: larger;
    font-weight: bolder;
}
</style>
