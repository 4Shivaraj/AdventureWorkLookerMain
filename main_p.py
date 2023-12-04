import pandas as pd
import random
from faker import Faker
from google.cloud import bigquery
from datetime import datetime
import os

fake = Faker()


def generate_ds_detail_data():
    nested_data={
        "building": fake.company(),
        "efs_tiers": fake.word(),
        "managed_by_google": fake.company(),
        "hwops_violations": random.randint(0, 5),
        "slip_details": f'[History]({fake.uri()})'
    }
    return nested_data

def generate_mm_detail_data():
    nested_data={
        "slip_source": fake.word(),
        "slip_category": fake.word(),
        "slip_type": fake.word(),
        "gpn": fake.word(),
        "gpn_part_name": fake.word(),
        "pool": f"d:{fake.word()}",
        "bug_id": f'[{random.randint(100000000, 999999999)}](http://b/{random.randint(100000000, 999999999)})',
        "aging": random.randint(1, 100),
        "metro_tier": random.choice(['tier1','tier2','tier3']),
        "is_test": fake.word(),
        "cluster": fake.word(),
        "slip_note": f"Issue type: {fake.word()}\n\n"
                     f"covers {random.randint(1, 10)} entities:\n"
                     f"  {fake.word()} - \n"
                     f"\nanalyzed at changelist {random.randint(100000000, 999999999)}",
        "slip_chart_order": random.randint(1, 10)
    }
    return nested_data

def generate_mm_summary_data():
    nested_data={
        "metro_tier": random.choice(['tier1','tier2','tier3']),
        "is_test": fake.word(),
        "time_above_buffer": random.randint(0, 18389334000),
        "total_time": 86400000000
    }
    return nested_data

def generate_mm_svops_detail_data():
    nested_data={
        "metro_tier": random.choice(['tier1','tier2','tier3']),
        "pool": f"d:{fake.word()}",
        "slip_source": fake.word(),
        "slip_category": fake.word(),
        "slip_type": fake.word(),
        "slip_note": f"covers {random.randint(1, 10)} entities:\n  " +
                     '\n  '.join([fake.word() for _ in range(random.randint(1, 10))]) +
                     f"\nanalyzed at changelist {random.randint(100000000, 999999999)}",
        "bug_id": None,
        "hwops_availability_score": random.uniform(0.8, 1.0)
    }
    return nested_data

def generate_mm_svops_summary_data():
    nested_data={
        "metro_tier": random.choice(['tier1','tier2','tier3']),
        "hwops_time_above_buffer": random.randint(0, 18389334000),
        "total_time": random.randint(0, 18389334000),
    }
    return nested_data

def generate_mm_svops_detail_data_v2():
    nested_data={
        "metro_tier": random.choice(['tier1','tier2','tier3']),
        "pool": f"d:{fake.word()}",
        "slip_source": "HWOps",
        "slip_category": "Staffing",
        "slip_type": "After-hours Infall",
        "slip_note": f"covers 7 entities:\n"
                     f"  {fake.word()} - \n"
                     f"  {fake.word()} - \n"
                     f"  {fake.word()} - \n"
                     f"  {fake.word()} - \n"
                     f"  {fake.word()} - \n"
                     f"  {fake.word()} - \n"
                     f"  {fake.word()} - \n"
                     f"\nanalyzed at changelist {fake.random_int(min=100000000, max=999999999)}",
        "bug_id": None,
        "hwops_availability_score": fake.random_int(min=0.9, max=1.0)
    }
    return nested_data

def generate_er_detail_data():
    nested_data={
        "edge_tier": 1,
        "efs_metro_lead": "roymartinez",
        "efs_metro_lead_om": "billyho",
        "efs_pm": "thilow",
        "sli": fake.word(),
        "slo_status": fake.word(),
        "slo_order": fake.random_int(min=-1, max=1),
        "slo_violation_bug": f"[bug](http://b/{fake.random_int(min=100000000, max=999999999)})",
        "nbr_of_repairs": fake.random_int(min=0, max=10),
        "percentage_in_repairs": fake.random_int(min=0, max=1),
        "out_of_slo_since": '2023-08-23',
        "out_of_slo_duration_days": fake.random_int(min=1, max=30),
        "metro_utilization": fake.random_int(min=0, max=1),
        "bug_id": fake.random_int(min=100000000, max=999999999),
        "mw_link": f"[MW Link](https://mw.corp.google.com/#name={fake.word()},{fake.word()},{fake.word()},{fake.word()},{fake.word()},{fake.word()})",
        "in_slo": fake.random_int(min=0, max=1),
        "out_slo": fake.random_int(min=0, max=1),
        "total": fake.random_int(min=1, max=10),
    }
    return nested_data

def generate_irpt_active_bugs_detail_data():
    nested_data={
        "bug_id": f'[{fake.random_int(min=100000000, max=999999999)}](https://b.corp.google.com/issues/{fake.random_int(min=100000000, max=999999999)})',
        "priority": "P2",
        "bug_type": "BUG",
        "title": fake.sentence(),
        "assignee": fake.user_name(),
        "manager_name": fake.first_name(),
        "assignment_slo": "INSLO",
        "response_slo": "INSLO",
        "closure_slo": "INSLO",
        "bug_status": fake.word().upper(),
        "creation_date": '2023-08-23',
        "status": "Active",
        "last_modified_date": '2023-08-23',
        "slo_status": "INSLO",
        "total": fake.random_int(min=1, max=10),
        "assign_flg": "Y",
        "slo_flg": "Y",
        "latest_component_path": fake.random_int(min=1, max=10),
    }
    return nested_data

def generate_irpt_summary_data():
    nested_data={
        "bug_id": fake.random_int(min=100000000, max=999999999),
        "slo_all_met": 1
    }
    return nested_data

def generate_bct_detail_summary_data():
    nested_data = {
        "viewpoint_link": f"[Viewpoint Link](http://viewpoint/{fake.word()})",
        "phase_id": fake.word(),
        "slo_target_date": '2023-08-23',
        "slip_code_tier_1": fake.word(),
        "slip_code_tier_2": fake.word(),
        "root_cause_owner": fake.word(),
        "build_type": fake.word(),
        "process_model": fake.word(),
        "comment": fake.sentence(),
        "slo_slip_type": fake.word(),
        "is_marine_or_payload": fake.random_element(elements=(True, False)),
        "marine_payload_flag": fake.word(),
        "phase_owner": fake.word(),
        "bct_miss_count": fake.random_int(min=0, max=10),
        "bct_met_count": fake.random_int(min=0, max=10),
        "bct_total_count": fake.random_int(min=1, max=10),
    }
    return nested_data


def generate_botd_detail_summary_data():
    nested_data = {
        "viewpoint_link": f"[Viewpoint Link](http://viewpoint/{fake.word()})",
        "slo_target_date": '2023-08-23',
        "completion_date": '2023-08-23',
        "slip_reason": fake.word(),
        "slip_reason_category": fake.word(),
        "rack_type": fake.word(),
        "build_type": fake.word(),
        "builds_otd_numerator": fake.random_int(min=0, max=10),
        "builds_otd_denominator": fake.random_int(min=1, max=10),
        "miss_count": fake.random_int(min=0, max=10),
    }
    return nested_data

def generate_bm_active_bugs_detail_data():
    nested_data = {
        "bug_id": fake.uuid4(),
        "priority": fake.word(),
        "bug_type": fake.word(),
        "title": fake.sentence(),
        "assignee": fake.name(),
        "manager_name": fake.name(),
        "assignment_slo": '2023-08-23',
        "response_slo": '2023-08-23',
        "closure_slo": '2023-08-23',
        "bug_status": fake.word(),
        "creation_date": '2023-08-23',
        "status": fake.word(),
        "last_modified_date": '2023-08-23',
        "slo_status": fake.word(),
        "total": fake.random_int(min=1, max=100),
        "assign_flg": fake.word(),
        "slo_flg": fake.word(),
        "latest_component_path": fake.word(),
    }
    return nested_data

def generate_ds_rca_detail_data():
    nested_data = {
        "campus": fake.word(),
        "location_type": fake.word(),
        "violation_type": fake.word(),
        "bug_id": fake.random_int(min=1, max=100),
        "slip_root_cause": fake.word(),
        "rca_duration_days": fake.random_int(min=0, max=10),
        "verified_by_om_days": fake.random_int(min=0, max=10)
    }
    return nested_data

# Function to generate dummy DataFrame
def generate_dummy_data():
    data = {
        "calendar_date":  '2023-08-23',
        "week_start_date":  '2023-08-24',
        "month_start_date":  '2023-08-25',
        "quarter_start_date":  '2023-08-26',
        "year_start_date":  '2023-08-23',
        "week_num": fake.random_int(min=1, max=52),
        "month_num": fake.random_int(min=1, max=12),
        "quarter_num": fake.random_int(min=1, max=4),
        "year_num": fake.random_int(min=2020, max=2023),
        "region": random.choice(['APAC', 'NASA', 'EMEA']),
        # Choose from specified conditions
        "metro": random.choice([
            'TRN', 'MNL', 'SQL', 'SCL', 'AMS', 'PHX', 'ORD', 'YYZ', 'ICN', 'FRA', 'PAR', 'LAX', 'ATL', 'SEA', 'MIA',
            'DHR', 'PEK', 'LAS', 'SFO', 'DMM', 'KBP', 'LGA', 'DEL', 'MAD', 'DUB', 'ARN', 'DFW', 'MRS', 'PDX', 'OMA',
            'HEM', 'HHN', 'SIN', 'LOS', 'BER', 'ZRH', 'BKK', 'BUD', 'TSA', 'DLS', 'LIS', 'AGR', 'TOA', 'NRT']),
        "latitude": fake.random_int(min=0, max=50),
        "longitude": fake.random_int(min=0, max=50),
        "ds_detail_data": generate_ds_detail_data(),
        "ds_hwops_violations": fake.random_int(min=0, max=5),
        "ds_processed_count": fake.random_int(min=100, max=500),
        "mm_detail_data": generate_mm_detail_data(),
        "mm_summary_data": generate_mm_summary_data(),
        "mmt1_slo_sum": fake.random_int(min=0, max=12),
        "mmt1_slo_count": fake.random_int(min=1, max=4),
        "mmt23_slo_sum": fake.random_int(min=0, max=15),
        "mmt23_slo_count": fake.random_int(min=1, max=4),
        "mm_svops_detail_data": generate_mm_svops_detail_data(),
        "mm_svops_summary_data": generate_mm_svops_summary_data(),
        "mm_svops_slo_sum": fake.random_int(min=0, max=8),
        "mm_svops_slo_count": fake.random_int(min=1, max=4),
        "er_detail_data": generate_er_detail_data(),
        "er_out_slo": fake.random_int(min=0, max=1),
        "er_in_slo": fake.random_int(min=0, max=1),
        "er_total": fake.random_int(min=1, max=4),
        "irpt_active_bugs_detail_data": generate_irpt_active_bugs_detail_data(),
        "irpt_summary_data": generate_irpt_summary_data(),
        "irpt_slo_met": fake.random_int(min=1, max=4),
        "irpt_total_bugs": fake.random_int(min=1, max=4),
        "bct_detail_summary_data": generate_bct_detail_summary_data(),
        "bct_met_count": fake.random_int(min=1, max=4),
        "bct_miss_count": fake.random_int(min=1, max=4),
        "bct_total_count": fake.random_int(min=1, max=4),
        "botd_detail_summary_data": generate_botd_detail_summary_data(),
        "botd_met_count": fake.random_int(min=1, max=4),
        "botd_miss_count": fake.random_int(min=1, max=4),
        "botd_total_count": fake.random_int(min=1, max=4),
        "bm_active_bugs_detail_data": generate_bm_active_bugs_detail_data(),
        "bm_escalated_cnt": fake.random_int(min=1, max=4),
        "bm_closed_cnt": fake.random_int(min=1, max=4),
        "ds_rca_detail_data": generate_ds_rca_detail_data(),
        "ds_rca_root_cause_met_sli_sum": fake.random_int(min=1, max=4),
        "ds_rca_root_cause_met_sli_count": fake.random_int(min=1, max=4),
        "ds_rca_om_verified_met_sli_sum": fake.random_int(min=1, max=4),
        "ds_rca_om_verified_met_sli_count": fake.random_int(min=1, max=4),
        "data_refresh": '2023-11-16 17:33:09.103+05:30'
    }
    return data

def dummy_data_mapping():
    data = generate_dummy_data()
    data_1 = [{
        "calendar_date": data['calendar_date'],
        "week_start_date": data['week_start_date'],
        "month_start_date": data['month_start_date'],
        "quarter_start_date": data['quarter_start_date'],
        "year_start_date": data['year_start_date'],
        "week_num": data['week_num'],
        "month_num": data['month_num'],
        "quarter_num": data['quarter_num'],
        "year_num": data['year_num'],
        "region": data['region'],
        "metro": data['metro'],
        "latitude": data['latitude'],
        "longitude": data['longitude'],
        "ds_detail_data": [{
            "building": data['ds_detail_data']['building'],
            "efs_tiers": data['ds_detail_data']['efs_tiers'],
            "managed_by_google": data['ds_detail_data']['managed_by_google'],
            "hwops_violations": data['ds_detail_data']['hwops_violations'],
            "slip_details": data['ds_detail_data']['slip_details']
        }],
        "ds_hwops_violations": data['ds_hwops_violations'],
        "ds_processed_count": data['ds_processed_count'],
        "mm_detail_data": [{
            "slip_source": data['mm_detail_data']['slip_source'],
            "slip_category": data['mm_detail_data']['slip_category'],
            "slip_type": data['mm_detail_data']['slip_type'],
            "gpn": data['mm_detail_data']['gpn'],
            "gpn_part_name": data['mm_detail_data']['gpn_part_name'],
            "pool": data['mm_detail_data']['pool'],
            "bug_id": data['mm_detail_data']['bug_id'],
            "aging": data['mm_detail_data']['aging'],
            "metro_tier": data['mm_detail_data']['metro_tier'],
            "is_test": data['mm_detail_data']['is_test'],
            "cluster": data['mm_detail_data']['cluster'],
            "slip_note": data['mm_detail_data']['slip_note'],
            "slip_chart_order": data['mm_detail_data']['slip_chart_order']
        }],
        "mm_summary_data": [{
            "metro_tier": data['mm_summary_data']['metro_tier'],
            "is_test": data['mm_summary_data']['is_test'],
            "time_above_buffer": data['mm_summary_data']['time_above_buffer'],
            "total_time": data['mm_summary_data']['total_time']
        }],
        "mmt1_slo_sum": data['mmt1_slo_sum'],
        "mmt1_slo_count": data['mmt1_slo_count'],
        "mmt23_slo_sum": data['mmt23_slo_sum'],
        "mmt23_slo_count": data['mmt23_slo_count'],
        "mm_svops_detail_data": [{
            "metro_tier": data['mm_svops_detail_data']['metro_tier'],
            "pool": data['mm_svops_detail_data']['pool'],
            "slip_source": data['mm_svops_detail_data']['slip_source'],
            "slip_category": data['mm_svops_detail_data']['slip_category'],
            "slip_type": data['mm_svops_detail_data']['slip_type'],
            "slip_note": data['mm_svops_detail_data']['slip_note'],
            "bug_id": data['mm_svops_detail_data']['bug_id'],
            "hwops_availability_score": data['mm_svops_detail_data']['hwops_availability_score']
        }],
        "mm_svops_summary_data": [{
            "metro_tier": data['mm_svops_summary_data']['metro_tier'],
            "hwops_time_above_buffer": data['mm_svops_summary_data']['hwops_time_above_buffer'],
            "total_time": data['mm_svops_summary_data']['total_time']
        }],
        "mm_svops_slo_sum": data['mm_svops_slo_sum'],
        "mm_svops_slo_count": data['mm_svops_slo_count'],
        "er_detail_data": [{
            "edge_tier": data['er_detail_data']['edge_tier'],
            "efs_metro_lead": data['er_detail_data']['efs_metro_lead'],
            "efs_metro_lead_om": data['er_detail_data']['efs_metro_lead_om'],
            "efs_pm": data['er_detail_data']['efs_pm'],
            "sli": data['er_detail_data']['sli'],
            "slo_status": data['er_detail_data']['slo_status'],
            "slo_order": data['er_detail_data']['slo_order'],
            "slo_violation_bug": data['er_detail_data']['slo_violation_bug'],
            "nbr_of_repairs": data['er_detail_data']['nbr_of_repairs'],
            "percentage_in_repairs": data['er_detail_data']['percentage_in_repairs'],
            "out_of_slo_since": data['er_detail_data']['out_of_slo_since'],
            "out_of_slo_duration_days": data['er_detail_data']['out_of_slo_duration_days'],
            "metro_utilization": data['er_detail_data']['metro_utilization'],
            "bug_id": data['er_detail_data']['bug_id'],
            "mw_link": data['er_detail_data']['mw_link'],
            "in_slo": data['er_detail_data']['in_slo'],
            "out_slo": data['er_detail_data']['out_slo'],
            "total": data['er_detail_data']['total']
        }],
        "er_out_slo": data['er_out_slo'],
        "er_in_slo": data['er_in_slo'],
        "er_total": data['er_total'],
        "irpt_active_bugs_detail_data": [{
            "bug_id": data['irpt_active_bugs_detail_data']['bug_id'],
            "priority": data['irpt_active_bugs_detail_data']['priority'],
            "bug_type": data['irpt_active_bugs_detail_data']['bug_type'],
            "title": data['irpt_active_bugs_detail_data']['title'],
            "assignee": data['irpt_active_bugs_detail_data']['assignee'],
            "manager_name": data['irpt_active_bugs_detail_data']['manager_name'],
            "assignment_slo": data['irpt_active_bugs_detail_data']['assignment_slo'],
            "response_slo": data['irpt_active_bugs_detail_data']['response_slo'],
            "closure_slo": data['irpt_active_bugs_detail_data']['closure_slo'],
            "bug_status": data['irpt_active_bugs_detail_data']['bug_status'],
            "creation_date": data['irpt_active_bugs_detail_data']['creation_date'],
            "status": data['irpt_active_bugs_detail_data']['status'],
            "last_modified_date": data['irpt_active_bugs_detail_data']['last_modified_date'],
            "slo_status": data['irpt_active_bugs_detail_data']['slo_status'],
            "total": data['irpt_active_bugs_detail_data']['total'],
            "assign_flg": data['irpt_active_bugs_detail_data']['assign_flg'],
            "slo_flg": data['irpt_active_bugs_detail_data']['slo_flg'],
            "latest_component_path": data['irpt_active_bugs_detail_data']['latest_component_path']
        }],
        "irpt_summary_data": [{
            "bug_id": data['irpt_summary_data']['bug_id'],
            "slo_all_met": data['irpt_summary_data']['slo_all_met']
        }],
        "irpt_slo_met": data['irpt_slo_met'],
        "irpt_total_bugs": data['irpt_total_bugs'],
        "bct_detail_summary_data": [{
            "viewpoint_link": data['bct_detail_summary_data']['viewpoint_link'],
            "phase_id": data['bct_detail_summary_data']['phase_id'],
            "slo_target_date": data['bct_detail_summary_data']['slo_target_date'],
            "slip_code_tier_1": data['bct_detail_summary_data']['slip_code_tier_1'],
            "slip_code_tier_2": data['bct_detail_summary_data']['slip_code_tier_2'],
            "root_cause_owner": data['bct_detail_summary_data']['root_cause_owner'],
            "build_type": data['bct_detail_summary_data']['build_type'],
            "process_model": data['bct_detail_summary_data']['process_model'],
            "comment": data['bct_detail_summary_data']['comment'],
            "slo_slip_type": data['bct_detail_summary_data']['slo_slip_type'],
            "is_marine_or_payload": data['bct_detail_summary_data']['is_marine_or_payload'],
            "marine_payload_flag": data['bct_detail_summary_data']['marine_payload_flag'],
            "phase_owner": data['bct_detail_summary_data']['phase_owner'],
            "bct_miss_count": data['bct_detail_summary_data']['bct_miss_count'],
            "bct_met_count": data['bct_detail_summary_data']['bct_met_count'],
            "bct_total_count": data['bct_detail_summary_data']['bct_total_count']
        }],
        "bct_met_count": data['bct_met_count'],
        "bct_miss_count": data['bct_miss_count'],
        "bct_total_count": data['bct_total_count'],
        "botd_detail_summary_data": [{
            "viewpoint_link": data['botd_detail_summary_data']['viewpoint_link'],
            "slo_target_date": data['botd_detail_summary_data']['slo_target_date'],
            "completion_date": data['botd_detail_summary_data']['completion_date'],
            "slip_reason": data['botd_detail_summary_data']['slip_reason'],
            "slip_reason_category": data['botd_detail_summary_data']['slip_reason_category'],
            "rack_type": data['botd_detail_summary_data']['rack_type'],
            "build_type": data['botd_detail_summary_data']['build_type'],
            "builds_otd_numerator": data['botd_detail_summary_data']['builds_otd_numerator'],
            "builds_otd_denominator": data['botd_detail_summary_data']['builds_otd_denominator'],
            "miss_count": data['botd_detail_summary_data']['miss_count']
        }],
        "botd_met_count": data['botd_met_count'],
        "botd_miss_count": data['botd_miss_count'],
        "botd_total_count": data['botd_total_count'],
        "bm_active_bugs_detail_data": [{
            "bug_id": data['bm_active_bugs_detail_data']['bug_id'],
            "priority": data['bm_active_bugs_detail_data']['priority'],
            "bug_type": data['bm_active_bugs_detail_data']['bug_type'],
            "title": data['bm_active_bugs_detail_data']['title'],
            "assignee": data['bm_active_bugs_detail_data']['assignee'],
            "manager_name": data['bm_active_bugs_detail_data']['manager_name'],
            "assignment_slo": data['bm_active_bugs_detail_data']['assignment_slo'],
            "response_slo": data['bm_active_bugs_detail_data']['response_slo'],
            "closure_slo": data['bm_active_bugs_detail_data']['closure_slo'],
            "bug_status": data['bm_active_bugs_detail_data']['bug_status'],
            "creation_date": data['bm_active_bugs_detail_data']['creation_date'],
            "status": data['bm_active_bugs_detail_data']['status'],
            "last_modified_date": data['bm_active_bugs_detail_data']['last_modified_date'],
            "slo_status": data['bm_active_bugs_detail_data']['slo_status'],
            "total": data['bm_active_bugs_detail_data']['total'],
            "assign_flg": data['bm_active_bugs_detail_data']['assign_flg'],
            "slo_flg": data['bm_active_bugs_detail_data']['slo_flg'],
            "latest_component_path": data['bm_active_bugs_detail_data']['latest_component_path']
        }],
        "bm_escalated_cnt": data['bm_escalated_cnt'],
        "bm_closed_cnt": data['bm_closed_cnt'],
        "ds_rca_detail_data": [{
            "campus": data['ds_rca_detail_data']['campus'],
            "location_type": data['ds_rca_detail_data']['location_type'],
            "violation_type": data['ds_rca_detail_data']['violation_type'],
            "bug_id": data['ds_rca_detail_data']['bug_id'],
            "slip_root_cause": data['ds_rca_detail_data']['slip_root_cause'],
            "rca_duration_days": data['ds_rca_detail_data']['rca_duration_days'],
            "verified_by_om_days": data['ds_rca_detail_data']['verified_by_om_days']
        }],
        "ds_rca_root_cause_met_sli_sum": data['ds_rca_root_cause_met_sli_sum'],
        "ds_rca_root_cause_met_sli_count": data['ds_rca_root_cause_met_sli_count'],
        "ds_rca_om_verified_met_sli_sum": data['ds_rca_om_verified_met_sli_sum'],
        "ds_rca_om_verified_met_sli_count": data['ds_rca_om_verified_met_sli_count'],
        "data_refresh": data['data_refresh']
    }]
    return data_1



if __name__ == "__main__":
    # Generate dummy data with 100 rows
    project_id = 'parabolic-braid-402009'
    dataset_id = 'three_pdc_metrics_poc'
    table_id = 'sample_demo_1'
    keyfile_path = 'parabolic-braid-402009-5ec2ba9e489d.json'
    os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = keyfile_path

    # Set up the BigQuery client
    client = bigquery.Client(project=project_id)
    # Get the BigQuery dataset and table
    dataset_ref = client.dataset(dataset_id)
    table_ref = dataset_ref.table(table_id)
    table = client.get_table(table_ref)
    for i in range(10):
        data = dummy_data_mapping()
        # Insert data into BigQuery table
        errors = client.insert_rows(table, data)
        if errors:
            print(f"Errors encountered while inserting data: {errors}")
        else:
            print("Data successfully inserted into BigQuery.")