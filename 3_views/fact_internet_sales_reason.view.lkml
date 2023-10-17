view: fact_internet_sales_reason {
  sql_table_name: dbo.FactInternetSalesReason ;;

  dimension: sales_order_line_number {
    type: number
    sql: ${TABLE}.SalesOrderLineNumber ;;
  }
  dimension: sales_order_number {
    type: string
    sql: ${TABLE}.SalesOrderNumber ;;
  }
  dimension: sales_reason_key {
    type: number
    sql: ${TABLE}.SalesReasonKey ;;
  }
  measure: count {
    type: count
  }
}
