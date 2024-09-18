package com.dailyMarket.www.vo;

public class ChattingRoomVO {

	private int chattingNo; //채팅방번호
	private String lastMessage; //최근 메시지
	private String sendTime; // 메세지 보낸 시간
	private int targetNo;//받는 회원 번호
	private String tagetNickName; //받는 회원 닉네임
	private String targetProfile; //받는 회원 프로필 사진
	private int notReadCount; //읽지 않은 메시지 개수
	
	private int memberNo;
	
	public int getChattingNo() {
		return chattingNo;
	}
	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}
	public String getLastMessage() {
		return lastMessage;
	}
	public void setLastMessage(String lastMessage) {
		this.lastMessage = lastMessage;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public int getTargetNo() {
		return targetNo;
	}
	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}
	public String getTagetNickName() {
		return tagetNickName;
	}
	public void setTagetNickName(String tagetNickName) {
		this.tagetNickName = tagetNickName;
	}
	public String getTargetProfile() {
		return targetProfile;
	}
	public void setTargetProfile(String targetProfile) {
		this.targetProfile = targetProfile;
	}
	public int getNotReadCount() {
		return notReadCount;
	}
	public void setNotReadCount(int notReadCount) {
		this.notReadCount = notReadCount;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	
	
}
