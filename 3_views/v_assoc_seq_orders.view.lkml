view: v_assoc_seq_orders {
  sql_table_name: dbo.vAssocSeqOrders ;;

  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
  }
  dimension: income_group {
    type: string
    sql: ${TABLE}.IncomeGroup ;;
  }
  dimension: order_number {
    type: string
    sql: ${TABLE}.OrderNumber ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }
  measure: count {
    type: count
  }
}
