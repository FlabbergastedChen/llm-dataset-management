<template>
    <div class="edit-popup">
        <popup
            ref="popupRef"
            :title="popupTitle"
            :async="true"
            width="900px"
            :clickModalClose="true"
            :confirmButtonText="confirmButtonTitle"
            cancelButtonText="关闭"
            @confirm="handleUnfold"
            @close="handleClose"
        >
            <div class="content">
                <el-collapse v-model="activeNames" @change="handleChange">
                    <el-collapse-item
                        v-for="(item, index) in history"
                        :key="index"
                        :title="item[0]"
                        :name="index"
                    >
                        <div>{{ item[1] }}</div>
                    </el-collapse-item>
                </el-collapse>
            </div>
        </popup>
    </div>
</template>
<script lang="ts" setup>
import type { FormInstance } from 'element-plus'
import { directivesDetail } from '@/api/finetuned'
import Popup from '@/components/popup/index.vue'
import feedback from '@/utils/feedback'
import type { PropType } from 'vue'
import { ref } from 'vue'

const activeNames = ref([])
const handleChange = (val: string[]) => {
    console.log(val)
}
defineProps({
    dictData: {
        type: Object as PropType<Record<string, any[]>>,
        default: () => ({})
    }
})
const emit = defineEmits(['success', 'close'])
const popupRef = shallowRef<InstanceType<typeof Popup>>()
const mode = ref('add')
const popupTitle = computed(() => {
    return '历史对话'
})
const confirmButtonTitle = computed(() => {
    return activeNames.value.length > 0 ? '全部关闭' : '全部展开'
})
const history = ref([])

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
    const data = await directivesDetail({
        id: row.id
    })
    setFormData(data)
}

const getData = (data: Record<string, any>) => {
    if (data.history) {
        history.value = JSON.parse(data.history)
    }
}

const handleUnfold = () => {
    if (activeNames.value.length > 0) {
        activeNames.value = []
    } else {
        activeNames.value = Array.from({ length: history.value.length }, (val, i) => i)
    }
}

const handleClose = () => {
    emit('close')
}

defineExpose({
    open,
    setFormData,
    getData,
    getDetail
})
</script>
<style scoped>
.content {
    height: 400px;
    overflow: auto;
}
</style>
