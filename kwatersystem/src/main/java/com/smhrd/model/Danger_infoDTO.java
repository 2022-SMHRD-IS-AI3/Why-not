package com.smhrd.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@RequiredArgsConstructor
@NoArgsConstructor

public class Danger_infoDTO {
	private String filt_num;
	@NonNull private String filt_name;
	@NonNull private int const_year;
	@NonNull private int sup_popu;
	@NonNull private double oper_rate;
	@NonNull private int sup_danger_no;
	@NonNull private double oper_danger;
	@NonNull private int sup_danger;
	@NonNull private int const_danger;
	@NonNull private int inta_danger;
	@NonNull private int filt_danger;
	private String local;
	
	

}
