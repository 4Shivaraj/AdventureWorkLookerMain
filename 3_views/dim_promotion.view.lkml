view: dim_promotion {
  sql_table_name: dbo.DimPromotion ;;

  dimension: discount_pct {
    type: number
    sql: ${TABLE}.DiscountPct ;;
  }
  dimension_group: end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.EndDate ;;
  }
  dimension: english_promotion_category {
    type: string
    sql: ${TABLE}.EnglishPromotionCategory ;;
  }
  dimension: english_promotion_name {
    type: string
    sql: ${TABLE}.EnglishPromotionName ;;
  }
  dimension: english_promotion_type {
    type: string
    sql: ${TABLE}.EnglishPromotionType ;;
  }
  dimension: french_promotion_category {
    type: string
    sql: ${TABLE}.FrenchPromotionCategory ;;
  }
  dimension: french_promotion_name {
    type: string
    sql: ${TABLE}.FrenchPromotionName ;;
  }
  dimension: french_promotion_type {
    type: string
    sql: ${TABLE}.FrenchPromotionType ;;
  }
  dimension: max_qty {
    type: number
    sql: ${TABLE}.MaxQty ;;
  }
  dimension: min_qty {
    type: number
    sql: ${TABLE}.MinQty ;;
  }
  dimension: promotion_alternate_key {
    type: number
    sql: ${TABLE}.PromotionAlternateKey ;;
  }
  dimension: promotion_key {
    type: number
    sql: ${TABLE}.PromotionKey ;;
  }
  dimension: spanish_promotion_category {
    type: string
    sql: ${TABLE}.SpanishPromotionCategory ;;
  }
  dimension: spanish_promotion_name {
    type: string
    sql: ${TABLE}.SpanishPromotionName ;;
  }
  dimension: spanish_promotion_type {
    type: string
    sql: ${TABLE}.SpanishPromotionType ;;
  }
  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.StartDate ;;
  }
  measure: count {
    type: count
    drill_fields: [english_promotion_name, spanish_promotion_name, french_promotion_name]
  }
}
