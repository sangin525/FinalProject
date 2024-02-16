package kr.co.project.common.upload;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import kr.co.project.foodMate.model.dto.FoodMateDTO;
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.recipe.model.dto.RecipeDTO;

public class UploadFile {

	private static final String UPLOAD_PATH="C:\\Users\\kaw19\\git\\finalProject\\FinalProject\\src\\main\\webapp\\resources\\uploads\\";
	public static boolean deleteFile(String fileName, String boardName) {
		// C:\\spring\\Project\\src\\main\\webapp\\resources\\uploads\\
		// 240103113409_cRvSeZPY.png
		// 240103113409_cRvSeZPY.png
		File file = new File(UPLOAD_PATH + boardName + fileName);
		return file.delete();

	}

	public static void uploadMethod(MultipartFile upload, RecipeDTO recipe, MemberDTO member, HttpSession session,
			String boardName, FoodMateDTO food) {
		if (!upload.isEmpty()) {
			// 원본 파일명 구하기
			String originName = upload.getOriginalFilename();

			// 확장자 구하기
			String extension = originName.substring(originName.lastIndexOf("."));

			// 현재 년-월-일-시-분-초
			LocalDateTime nowDate = LocalDateTime.now();

			// 데이터포맷을 년월일시분초로 가공
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmss");
			String output = nowDate.format(formatter);

			// 랜덤 문자열 생성
			int length = 8;
			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";

			Random random = new Random();
			String randomString = random.ints(length, 0, characters.length()) // 길이가 length인 난수 생성
					.mapToObj(characters::charAt) // 각 난수들을 characters에서 해당하는 문자의 인덱스로 매핑
					.map(Object::toString) // 위의 문자를 문자열로 변환
					.collect(Collectors.joining()); // 문자열 스트림을 하나의 문자열로 변환

			// 파일명 : 날짜_랜덤문자열.확장자
			// 231229144025_aK834NNM.png
			String fileName = (output + "_" + randomString + extension);

			// 경로+파일명
			// C:\\spring\\Project\\src\\main\\webapp\\resources\\uploads\\
			// 240103113409_cRvSeZPY.png
			// 240103113409_cRvSeZPY.png
			String filePathName = UPLOAD_PATH + boardName + fileName;

			// 서버에 파일 저장
			Path filePath = Paths.get(filePathName);

			try {
				upload.transferTo(filePath);
//				member.setUploadPath(UPLOAD_PATH + boardName);
//				member.setUploadName(filePathName);
//				member.setUploadOrigin(originName);
//				
//				recipe.setUploadPath(UPLOAD_PATH + boardName); // 업로드 경로
//				recipe.setUploadName(fileName); // 수정된 파일명
//				recipe.setUploadOriginName(originName); // 원본 파일명
//				
//				recipe.setFilePath(UPLOAD_PATH + boardName);;
//				recipe.setFileName(fileName);
//				recipe.setFileOrigin(originName);

				food.setUploadPath(UPLOAD_PATH + boardName);
				food.setUploadName(fileName);
				food.setUploadOrigin(originName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
	}

	public static void goodsUploadMethod(MultipartFile upload, GoodsDTO goodsDTO, HttpSession session) {
		String boardName = "goods";
		if (!upload.isEmpty()) {
			// 원본 파일명 구하기
			String originName = upload.getOriginalFilename();
			// 확장자 구하기
			String extension = originName.substring(originName.lastIndexOf("."));
			// 현재 년-월-일-시-분-초
			LocalDateTime nowDate = LocalDateTime.now();
			// 데이터포맷을 년월일시분초로 가공
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmmss");
			String output = nowDate.format(formatter);
			// 랜덤 문자열 생성
			int length = 8;
			String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
			Random random = new Random();
			String randomString = random.ints(length, 0, characters.length()) // 길이가 length인 난수 생성
					.mapToObj(characters::charAt) // 각 난수들을 characters에서 해당하는 문자의 인덱스로 매핑
					.map(Object::toString) // 위의 문자를 문자열로 변환
					.collect(Collectors.joining()); // 문자열 스트림을 하나의 문자열로 변환
			// 파일명 : 날짜_랜덤문자열.확장자
			// 231229144025_aK834NNM.png
			String fileName = (output + "_" + randomString + extension);
			// 경로+파일명
			// C:\\spring\\Project\\src\\main\\webapp\\resources\\uploads\\
			// 240103113409_cRvSeZPY.png
			// 240103113409_cRvSeZPY.png
			String filePathName = UPLOAD_PATH + boardName + "\\" + fileName;
			// 서버에 파일 저장
			Path filePath = Paths.get(filePathName);
			try {
				upload.transferTo(filePath);
				// goodsDTO.setUploadPath(UPLOAD_PATH + boardName); // 업로드 경로
				// goodsDTO.setUploadName(fileName); // 수정된 파일명
				// goodsDTO.setUploadOriginName(originName); // 원본 파일명
				goodsDTO.setG_file_path(UPLOAD_PATH + boardName + "\\" + fileName);
				goodsDTO.setG_file_name(fileName);
				goodsDTO.setG_origin_name(originName);
				// goodsDTO.setFileName(fileName);
				// goodsDTO.setFileOrigin(originName);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}