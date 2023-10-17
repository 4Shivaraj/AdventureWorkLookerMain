view: fact_sales_quota {
  sql_table_name: dbo.FactSalesQuota ;;

  dimension: calendar_quarter {
    type: number
    sql: ${TABLE}.CalendarQuarter ;;
  }
  dimension: calendar_year {
    type: number
    sql: ${TABLE}.CalendarYear ;;
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
  dimension: employee_key {
    type: number
    sql: ${TABLE}.EmployeeKey ;;
  }
  dimension: sales_amount_quota {
    type: string
    sql: ${TABLE}.SalesAmountQuota ;;
  }
  dimension: sales_quota_key {
    type: number
    sql: ${TABLE}.SalesQuotaKey ;;
  }
  measure: count {
    type: count
  }
}
