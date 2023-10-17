view: adventure_works_dwbuild_version {
  sql_table_name: dbo.AdventureWorksDWBuildVersion ;;

  dimension: dbversion {
    type: string
    sql: ${TABLE}.DBVersion ;;
  }
  dimension_group: version {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.VersionDate ;;
  }
  measure: count {
    type: count
  }
}
