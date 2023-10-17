view: dim_product_subcategory {
  sql_table_name: dbo.DimProductSubcategory ;;

  dimension: english_product_subcategory_name {
    type: string
    sql: ${TABLE}.EnglishProductSubcategoryName ;;
  }
  dimension: french_product_subcategory_name {
    type: string
    sql: ${TABLE}.FrenchProductSubcategoryName ;;
  }
  dimension: product_category_key {
    type: number
    sql: ${TABLE}.ProductCategoryKey ;;
  }
  dimension: product_subcategory_alternate_key {
    type: number
    sql: ${TABLE}.ProductSubcategoryAlternateKey ;;
  }
  dimension: product_subcategory_key {
    type: number
    sql: ${TABLE}.ProductSubcategoryKey ;;
  }
  dimension: spanish_product_subcategory_name {
    type: string
    sql: ${TABLE}.SpanishProductSubcategoryName ;;
  }
  measure: count {
    type: count
    drill_fields: [english_product_subcategory_name, spanish_product_subcategory_name, french_product_subcategory_name]
  }
}
