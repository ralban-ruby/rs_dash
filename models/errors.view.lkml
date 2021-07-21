  view: errors {
    sql_table_name: "RS"."ERRORS"
      ;;

    dimension: account_name {
      type: string
      sql: ${TABLE}."ACCOUNT_NAME" ;;
    }

    dimension_group: created {
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}."CREATED_DATE" ;;
    }

    dimension_group: date_error_occurred_c {
      type: time
      timeframes: [
        raw,
        date,
        week,
        month,
        quarter,
        year
      ]
      convert_tz: no
      datatype: date
      sql: ${TABLE}."DATE_ERROR_OCCURRED_C" ;;
    }

    dimension: employeeid {
      type: number
      value_format_name: id
      sql: ${TABLE}."EMPLOYEEID" ;;
    }

    dimension: caseid {
      type: number
      sql: ${TABLE}."ID" ;;
    }

    dimension: error_notes_c {
      type: string
      sql: ${TABLE}."ERROR_NOTES_C" ;;
    }

    dimension: error_specifics_c {
      type: string
      sql: ${TABLE}."ERROR_SPECIFICS_C" ;;
    }

    dimension: error_type_c {
      type: string
      sql: ${TABLE}."ERROR_TYPE_C" ;;
    }

    dimension: name {
      type: string
      sql: ${TABLE}."NAME" ;;
    }

    measure: count {
      type: count
      drill_fields: [account_name, name]
    }
  }
