view: dim_product {
  sql_table_name: dbo.DimProduct ;;

  dimension: arabic_description {
    type: string
    sql: ${TABLE}.ArabicDescription ;;
  }
  dimension: chinese_description {
    type: string
    sql: ${TABLE}.ChineseDescription ;;
  }
  dimension: class {
    type: string
    sql: ${TABLE}.Class ;;
  }
  dimension: color {
    type: string
    sql: ${TABLE}.Color ;;
  }
  dimension: days_to_manufacture {
    type: number
    sql: ${TABLE}.DaysToManufacture ;;
  }
  dimension: dealer_price {
    type: string
    sql: ${TABLE}.DealerPrice ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.EndDate ;;
  }
  dimension: english_description {
    type: string
    sql: ${TABLE}.EnglishDescription ;;
  }
  dimension: english_product_name {
    type: string
    sql: ${TABLE}.EnglishProductName ;;
  }
  dimension: finished_goods_flag {
    type: string
    sql: ${TABLE}.FinishedGoodsFlag ;;
  }
  dimension: french_description {
    type: string
    sql: ${TABLE}.FrenchDescription ;;
  }
  dimension: french_product_name {
    type: string
    sql: ${TABLE}.FrenchProductName ;;
  }
  dimension: german_description {
    type: string
    sql: ${TABLE}.GermanDescription ;;
  }
  dimension: hebrew_description {
    type: string
    sql: ${TABLE}.HebrewDescription ;;
  }
  dimension: japanese_description {
    type: string
    sql: ${TABLE}.JapaneseDescription ;;
  }
  dimension: large_photo {
    type: string
    sql: ${TABLE}.LargePhoto ;;
  }
  dimension: list_price {
    type: string
    sql: ${TABLE}.ListPrice ;;
  }
  dimension: model_name {
    type: string
    sql: ${TABLE}.ModelName ;;
  }
  dimension: product_alternate_key {
    type: string
    sql: ${TABLE}.ProductAlternateKey ;;
  }
  dimension: product_key {
    type: number
    sql: ${TABLE}.ProductKey ;;
  }
  dimension: product_line {
    type: string
    sql: ${TABLE}.ProductLine ;;
  }
  dimension: product_subcategory_key {
    type: number
    sql: ${TABLE}.ProductSubcategoryKey ;;
  }
  dimension: reorder_point {
    type: number
    sql: ${TABLE}.ReorderPoint ;;
  }
  dimension: safety_stock_level {
    type: number
    sql: ${TABLE}.SafetyStockLevel ;;
  }
  dimension: size {
    type: string
    sql: ${TABLE}.Size ;;
  }
  dimension: size_range {
    type: string
    sql: ${TABLE}.SizeRange ;;
  }
  dimension: size_unit_measure_code {
    type: string
    sql: ${TABLE}.SizeUnitMeasureCode ;;
  }
  dimension: spanish_product_name {
    type: string
    sql: ${TABLE}.SpanishProductName ;;
  }
  dimension: standard_cost {
    type: string
    sql: ${TABLE}.StandardCost ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.StartDate ;;
  }
  dimension: status {
    type: string
    sql: ${TABLE}.Status ;;
  }
  dimension: style {
    type: string
    sql: ${TABLE}.Style ;;
  }
  dimension: thai_description {
    type: string
    sql: ${TABLE}.ThaiDescription ;;
  }
  dimension: turkish_description {
    type: string
    sql: ${TABLE}.TurkishDescription ;;
  }
  dimension: weight {
    type: number
    sql: ${TABLE}.Weight ;;
  }
  dimension: weight_unit_measure_code {
    type: string
    sql: ${TABLE}.WeightUnitMeasureCode ;;
  }
  measure: count {
    type: count
    drill_fields: [english_product_name, spanish_product_name, french_product_name, model_name]
  }
}
