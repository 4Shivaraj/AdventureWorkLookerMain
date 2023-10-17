view: fact_additional_international_product_description {
  sql_table_name: dbo.FactAdditionalInternationalProductDescription ;;

  dimension: culture_name {
    type: string
    sql: ${TABLE}.CultureName ;;
  }
  dimension: product_description {
    type: string
    sql: ${TABLE}.ProductDescription ;;
  }
  dimension: product_key {
    type: number
    sql: ${TABLE}.ProductKey ;;
  }
  measure: count {
    type: count
    drill_fields: [culture_name]
  }
}
