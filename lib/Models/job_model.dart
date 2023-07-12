import 'package:flutter/cupertino.dart';

class Job {
  final String? id;
  final String? facilityName;
  final String? facilityLogo;
  final String? facilityAddress;
  final String? shift;
  final String title;
  final String? description;
  final int numberOfWorkers;
  final String payPerHour;
  final String workType;
  final String? employmentType;
  final String startDate;
  final String endDate;
  final String? startTime;
  final String? endTime;
  final String? breakType;
  final String? breakDuration;
  final String contactPerson;
  final String contactNumber;
  final String? documents;
  final bool? isApproved;
  final bool? isexpired;
  final String? createdAt;
  final String category;
  final String subCategory;
  final String facility;

  Job({
    required this.facilityLogo,
    required this.facilityAddress,
    this.id,
    this.facilityName,
    this.shift,
    required this.title,
    this.description,
    required this.numberOfWorkers,
    required this.payPerHour,
    required this.workType,
    this.employmentType,
    required this.startDate,
    required this.endDate,
    this.startTime,
    this.endTime,
    this.breakType,
    this.breakDuration,
    required this.contactPerson,
    required this.contactNumber,
    this.documents,
    this.isApproved,
    this.isexpired,
    this.createdAt,
    required this.category,
    required this.subCategory,
    required this.facility,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      id: json['id'],
      facilityName: json['facility_name'],
      facilityLogo: json['facility_logo'],
      facilityAddress: json['facility_address'],
      shift: json['shift'],
      title: json['title'],
      description: json['description'],
      numberOfWorkers: json['number_of_workers'],
      payPerHour: json['pay_per_hour'],
      workType: json['work_type'],
      employmentType: json['employment_type'],
      startDate: json['start_date'],
      endDate: json['end_date'],
      startTime: json['break_type'],
      endTime: json['end_time'],
      breakType: json['break_type'],
      breakDuration: json['break_duration'],
      contactPerson: json['contact_person'],
      contactNumber: json['contact_number'],
      documents: json['documents'],
      isApproved: json['is_approved'],
      isexpired: json['is_expired'],
      createdAt: json['created_ad'],
      category: json['category'],
      subCategory: json['sub_category'],
      facility: json['facility'],
    );
  }
}
