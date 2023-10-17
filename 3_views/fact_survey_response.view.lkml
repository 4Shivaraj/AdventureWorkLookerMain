view: fact_survey_response {
  sql_table_name: dbo.FactSurveyResponse ;;

  dimension: customer_key {
    type: number
    sql: ${TABLE}.CustomerKey ;;
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
  dimension: english_product_category_name {
    type: string
    sql: ${TABLE}.EnglishProductCategoryName ;;
  }
  dimension: english_product_subcategory_name {
    type: string
    sql: ${TABLE}.EnglishProductSubcategoryName ;;
  }
  dimension: product_category_key {
    type: number
    sql: ${TABLE}.ProductCategoryKey ;;
  }
  dimension: product_subcategory_key {
    type: number
    sql: ${TABLE}.ProductSubcategoryKey ;;
  }
  dimension: survey_response_key {
    type: number
    sql: ${TABLE}.SurveyResponseKey ;;
  }
  measure: count {
    type: count
    drill_fields: [english_product_category_name, english_product_subcategory_name]
  }
}
