view: dim_sales_reason {
  sql_table_name: dbo.DimSalesReason ;;

  dimension: sales_reason_alternate_key {
    type: number
    sql: ${TABLE}.SalesReasonAlternateKey ;;
  }
  dimension: sales_reason_key {
    type: number
    sql: ${TABLE}.SalesReasonKey ;;
  }
  dimension: sales_reason_name {
    type: string
    sql: ${TABLE}.SalesReasonName ;;
  }
  dimension: sales_reason_reason_type {
    type: string
    sql: ${TABLE}.SalesReasonReasonType ;;
  }
  measure: count {
    type: count
    drill_fields: [sales_reason_name]
  }
}
