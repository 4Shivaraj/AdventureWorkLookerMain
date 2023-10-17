view: fact_finance {
  sql_table_name: dbo.FactFinance ;;

  dimension: account_key {
    type: number
    sql: ${TABLE}.AccountKey ;;
  }
  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }
  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.Date ;;
  }
  dimension: date_key {
    type: number
    sql: ${TABLE}.DateKey ;;
  }
  dimension: department_group_key {
    type: number
    sql: ${TABLE}.DepartmentGroupKey ;;
  }
  dimension: finance_key {
    type: number
    sql: ${TABLE}.FinanceKey ;;
  }
  dimension: organization_key {
    type: number
    sql: ${TABLE}.OrganizationKey ;;
  }
  dimension: scenario_key {
    type: number
    sql: ${TABLE}.ScenarioKey ;;
  }
  measure: count {
    type: count
  }
}
