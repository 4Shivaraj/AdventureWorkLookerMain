view: v_assoc_seq_line_items {
  sql_table_name: dbo.vAssocSeqLineItems ;;

  dimension: line_number {
    type: number
    sql: ${TABLE}.LineNumber ;;
  }
  dimension: model {
    type: string
    sql: ${TABLE}.Model ;;
  }
  dimension: order_number {
    type: string
    sql: ${TABLE}.OrderNumber ;;
  }
  measure: count {
    type: count
  }
}
