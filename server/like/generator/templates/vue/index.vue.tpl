<template>
    <div class="index-lists">
        <el-card class="!border-none" shadow="never">
            <el-form ref="formRef" class="mb-[-16px]" :model="queryParams" :inline="true">
            {%- for column in columns %}
            {%- if column.is_query==1 %}
                {%- if column.html_type=="datetime" %}
                <el-form-item label="{{{ column.column_comment }}}" prop="{{{ column.java_field }}}">
                    <daterange-picker
                        v-model:startTime="queryParams.createTimeStart"
                        v-model:endTime="queryParams.createTimeEnd"
                    />
                </el-form-item>
                {%- elif column.html_type=="select" or column.html_type == "radio" %}
                <el-form-item label="{{{ column.column_comment }}}" prop="{{{ column.java_field }}}">
                    <el-select
                        v-model="queryParams.{{{ column.java_field }}}"
                        class="w-[280px]"
                        clearable
                    >
                        {%- if column.dict_type=="" %}
                        <el-option label="请选择字典生成" value="" />
                        {%- else %}
                        <el-option label="全部" value="" />
                        <el-option
                            v-for="(item, index) in dictData.{{{ column.dict_type }}}"
                            :key="index"
                            :label="item.name"
                            :value="item.value"
                        />
                        {%- endif %}
                    </el-select>
                </el-form-item>
                {%- elif column.html_type=="input" %}
                <el-form-item label="{{{ column.column_comment }}}" prop="{{{ column.java_field }}}">
                    <el-input class="w-[280px]" v-model="queryParams.{{{ column.java_field }}}" />
                </el-form-item>
                {%- endif %}
            {%- endif %}
            {%- endfor %}
                <el-form-item>
                    <el-button type="primary" @click="resetPage">查询</el-button>
                    <el-button @click="resetParams">重置</el-button>
                </el-form-item>
            </el-form>
        </el-card>
        <el-card class="!border-none mt-4" shadow="never">
            <div>
                <el-button v-perms="['{{{ module_name }}}:add']" type="primary" @click="handleAdd()">
                    <template #icon>
                        <icon name="el-icon-Plus" />
                    </template>
                    新增
                </el-button>
            </div>
            <el-table
                class="mt-4"
                size="large"
                v-loading="pager.loading"
                :data="pager.lists"
            >
            {%- for column in columns %}
            {%- if column.is_list %}
                {%- if column.dict_type!="" and (column.html_type=="select" or column.html_type=="radio" or column.html_type=="checkbox") %}
                <el-table-column label="{{{ column.column_comment }}}" prop="{{{ column.java_field }}}" min-width="100">
                    <template #default="{ row }">
                        <dict-value :options="dictData.{{{ column.dict_type }}}" :value="row.{{{ column.java_field }}}" />
                    </template>
                </el-table-column>
                {%- elif column.html_type=="imageUpload" %}
                <el-table-column label="{{{ column.column_comment }}}" prop="{{{ column.java_field }}}" min-width="100">
                    <template #default="{ row }">
                        <image-contain
                            :width="40"
                            :height="40"
                            :src="row.{{{ column.java_field }}}"
                            :preview-src-list="[row.{{{ column.java_field }}}]"
                            preview-teleported
                            hide-on-click-modal
                        />
                    </template>
                </el-table-column>
                {%- else %}
                <el-table-column label="{{{ column.column_comment }}}" prop="{{{ column.java_field }}}" min-width="100" />
                {%- endif %}
            {%- endif %}
            {%- endfor %}
                <el-table-column label="操作" width="120" fixed="right">
                    <template #default="{ row }">
                        <el-button
                            v-perms="['{{{ module_name }}}:edit']"
                            type="primary"
                            link
                            @click="handleEdit(row)"
                        >
                            编辑
                        </el-button>
                        <el-button
                            v-perms="['{{{ module_name }}}:del']"
                            type="danger"
                            link
                            @click="handleDelete(row.{{{ primary_key }}})"
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
        <edit-popup
            v-if="showEdit"
            ref="editRef"
            {%- if dict_fields|length>=1 %}
            :dict-data="dictData"
            {%- endif %}
            @success="getLists"
            @close="showEdit = false"
        />
    </div>
</template>
<script lang="ts" setup name="{{{ module_name }}}">
import { {{{ module_name }}}Delete, {{{ module_name }}}Lists } from '@/api/{{{ module_name }}}'
{%- if dict_fields|length>=1 %}
import { useDictData } from '@/hooks/useDictOptions'
{%- endif %}
import { usePaging } from '@/hooks/usePaging'
import feedback from '@/utils/feedback'
import EditPopup from './edit.vue'
const editRef = shallowRef<InstanceType<typeof EditPopup>>()
const showEdit = ref(false)
const queryParams = reactive({
{%- for column in columns %}
{%- if column.is_query %}
    {%- if column.html_type=="datetime" %}
    {{{ column.java_field }}}Start: '',
    {{{ column.java_field }}}End: '',
    {%- else %}
    {{{ column.java_field }}}: '',
    {%- endif %}
{%- endif %}
{%- endfor %}
})

const { pager, getLists, resetPage, resetParams } = usePaging({
    fetchFun: {{{ module_name }}}Lists,
    params: queryParams
})

{%- if dict_fields|length>=1 %}
{%- set dict_size = dict_fields|length - 1 %}
const { dictData } = useDictData<{
    {%- for dict in dict_fields %}
    {{{ dict }}}: any[]
    {%- endfor %}
}>([{%- for dict in dict_fields %}'{{{ dict }}}'{%- if dict_fields[dict_size] != dict %},{%- endif %}{%- endfor %}])
{%- endif %}


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

const handleDelete = async ({{{ primary_key }}}: number) => {
    await feedback.confirm('确定要删除？')
    await {{{ module_name }}}Delete({ {{{ primary_key }}} })
    feedback.msgSuccess('删除成功')
    getLists()
}

getLists()
</script>
