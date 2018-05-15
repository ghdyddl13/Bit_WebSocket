package kr.co.mycom.model;

import java.util.HashMap;
import java.util.List;




public interface RoomDAO {
 //메서드 정의
 //CRUD 기반
 int insertRoom(RoomDto dto);

 /*
 RoomDto getRoom(int roomno);*/
 List<RoomDto> getRoomList();
 
 UserDto loginUser(String userid,String pwd);
 int joinUser(UserDto dto);
 
}
