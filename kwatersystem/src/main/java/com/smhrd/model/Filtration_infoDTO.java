package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@RequiredArgsConstructor
@NoArgsConstructor
@AllArgsConstructor

public class Filtration_infoDTO {
	private String filt_num;
	private String filt_name; //정수장 이름
	@NonNull private String addr; // 주소
	private String local;
	private int const_year;
	private String sup_area; // 급수지역
	private int sup_pop;
	private double oper_rate;
	private String intake_no;
	private int danger_no;
	

}


