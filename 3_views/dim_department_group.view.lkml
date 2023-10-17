view: dim_department_group {
  sql_table_name: dbo.DimDepartmentGroup ;;

  dimension: department_group_key {
    type: number
    sql: ${TABLE}.DepartmentGroupKey ;;
  }
  dimension: department_group_name {
    type: string
    sql: ${TABLE}.DepartmentGroupName ;;
  }
  dimension: parent_department_group_key {
    type: number
    sql: ${TABLE}.ParentDepartmentGroupKey ;;
  }
  measure: count {
    type: count
    drill_fields: [department_group_name]
  }
}
