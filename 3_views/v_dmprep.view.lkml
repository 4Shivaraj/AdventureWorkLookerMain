view: v_dmprep {
  sql_table_name: dbo.vDMPrep ;;

  dimension: age {
    type: number
    sql: ${TABLE}.Age ;;
  }
  dimension: amount {
    type: string
    sql: ${TABLE}.Amount ;;
  }
  dimension: calendar_year {
    type: number
    sql: ${TABLE}.CalendarYear ;;
  }
  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
  }
  dimension: english_product_category_name {
    type: string
    sql: ${TABLE}.EnglishProductCategoryName ;;
  }
  dimension: fiscal_year {
    type: number
    sql: ${TABLE}.FiscalYear ;;
  }
  dimension: income_group {
    type: string
    sql: ${TABLE}.IncomeGroup ;;
  }
  dimension: line_number {
    type: number
    sql: ${TABLE}.LineNumber ;;
  }
  dimension: model {
    type: string
    sql: ${TABLE}.Model ;;
  }
  dimension: month {
    type: number
    sql: ${TABLE}.Month ;;
  }
  dimension: order_number {
    type: string
    sql: ${TABLE}.OrderNumber ;;
  }
  dimension: quantity {
    type: number
    sql: ${TABLE}.Quantity ;;
  }
  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }
  measure: count {
    type: count
    drill_fields: [english_product_category_name]
  }
}
