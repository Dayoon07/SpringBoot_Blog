package com.e.d.model.vo;

import java.time.LocalDateTime;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class NoticeVo {
	private int noticeid;
	private String noticetitle;
	private String noticecontent;
	private LocalDateTime dateTime;
	private String formattedDate;
	
	public String getFormattedDate() {
        return formattedDate;
    }

    public void setFormattedDate(String formattedDate) {
        this.formattedDate = formattedDate;
    }
}