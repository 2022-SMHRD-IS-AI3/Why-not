package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor
@Getter

public class Intake_quality {
	
	@NonNull private int i_index;
	private String intake_no; 
	private Integer year;
	private Integer b_1;
	private Integer b_2;
	private Integer b_3;
	private Integer b_4;
	private Integer b_5;
	private Integer b_6;
	private Integer b_7;
	private Integer b_8;
	private Integer b_9;
}
