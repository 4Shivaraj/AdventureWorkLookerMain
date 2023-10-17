view: dim_account {
  sql_table_name: dbo.DimAccount ;;

  dimension: account_code_alternate_key {
    type: number
    sql: ${TABLE}.AccountCodeAlternateKey ;;
  }
  dimension: account_description {
    type: string
    sql: ${TABLE}.AccountDescription ;;
  }
  dimension: account_key {
    type: number
    sql: ${TABLE}.AccountKey ;;
  }
  dimension: account_type {
    type: string
    sql: ${TABLE}.AccountType ;;
  }
  dimension: custom_member_options {
    type: string
    sql: ${TABLE}.CustomMemberOptions ;;
  }
  dimension: custom_members {
    type: string
    sql: ${TABLE}.CustomMembers ;;
  }
  dimension: operator {
    type: string
    sql: ${TABLE}.Operator ;;
  }
  dimension: parent_account_code_alternate_key {
    type: number
    sql: ${TABLE}.ParentAccountCodeAlternateKey ;;
  }
  dimension: parent_account_key {
    type: number
    sql: ${TABLE}.ParentAccountKey ;;
  }
  dimension: value_type {
    type: string
    sql: ${TABLE}.ValueType ;;
  }
  measure: count {
    type: count
  }
}
