package com.ace.thrifty.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Coordinate {

	private double swLat;
	private double swLng;
	private double neLat;
	private double neLng;
}
