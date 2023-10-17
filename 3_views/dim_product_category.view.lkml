view: dim_product_category {
  sql_table_name: dbo.DimProductCategory ;;

  dimension: english_product_category_name {
    type: string
    sql: ${TABLE}.EnglishProductCategoryName ;;
  }
  dimension: french_product_category_name {
    type: string
    sql: ${TABLE}.FrenchProductCategoryName ;;
  }
  dimension: product_category_alternate_key {
    type: number
    sql: ${TABLE}.ProductCategoryAlternateKey ;;
  }
  dimension: product_category_key {
    type: number
    sql: ${TABLE}.ProductCategoryKey ;;
  }
  dimension: spanish_product_category_name {
    type: string
    sql: ${TABLE}.SpanishProductCategoryName ;;
  }
  measure: count {
    type: count
    drill_fields: [english_product_category_name, spanish_product_category_name, french_product_category_name]
  }
}
