package kr.co.project.common.upload;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import kr.co.project.foodMate.model.dto.FoodMateDTO;
import kr.co.project.goods.model.dto.GoodsDTO;
import kr.co.project.goods.model.dto.GoodsPhotosDTO;
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.recipe.model.dto.RecipeDTO;

public class MultiUploadFile {


	private static final String UPLOAD_PATH = "C:\\Users\\pje97\\git\\finalProject\\FinalProject\\src\\main\\webapp\\resources\\uploads\\";






	public static boolean deleteFile(List<RecipeDTO> fileName,List<RecipeDTO> sequenceFileName) {
		// C:\\spring\\Project\\src\\main\\webapp\\resources\\uploads\\        240103113409_cRvSeZPY.png

		// 240103113409_cRvSeZPY.png
		// 240103113409_cRvSeZPY.png
		int deleteCheck = 0;

		for (RecipeDTO r : fileName) {
			for (RecipeDTO r2 : sequenceFileName) {
				File seqfile = new File(UPLOAD_PATH + "\\recipe\\" + r2.getFileName());
				System.out.println(seqfile);
				if (seqfile.delete()) {
				}
			}
			File file = new File(UPLOAD_PATH + "\\recipe\\" + r.getFileName());
			System.out.println(file);
			if (file.delete()) {
			}
			deleteCheck++;
		}
		if (deleteCheck == fileName.size()) {
			return true;
		} else {
			return false;
		}

	}

	public static String uploadMethod(List<MultipartFile> multiFileList, MultipartFile file, String fileContent,
			RecipeDTO recipe, MemberDTO member, HttpServletRequest request, HttpSession session, String boardName,
			List<RecipeDTO> recipeList, List<FoodMateDTO> foodMate) {
//			File fileCheck = new File(UPLOAD_PATH);

		List<Map<String, String>> fileList = new ArrayList<>();

		for (int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String ext = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + ext;

			// 데이터포맷을 년월일시분초로 가공
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);

			RecipeDTO addList = new RecipeDTO();
			if (i == 0) {
				addList.setUploadOriginName(originFile);
				addList.setUploadName(changeFile);
				addList.setUploadPath(UPLOAD_PATH + "\\recipe\\");
			} else {
				addList.setFileOrigin(originFile);
				addList.setFileName(changeFile);
				addList.setFilePath(UPLOAD_PATH + "\\recipeSequence\\");
			}
			recipeList.add(addList);
			fileList.add(map);
		}

		try {
			for (int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(UPLOAD_PATH + "\\recipe\\" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
			}
		} catch (IllegalStateException | IOException e) {
			for (int i = 0; i < multiFileList.size(); i++) {
				new File(UPLOAD_PATH + "\\recipe\\" + fileList.get(i).get("changeFile")).delete();
			}
			e.printStackTrace();
		}
		return "result";
	}

	public static String goodsUploadMethod(List<MultipartFile> multiFileList, HttpSession session, GoodsDTO goods,
			List<GoodsPhotosDTO> goodsPhotoList, List<GoodsPhotosDTO> detailPhotoList) {
		List<Map<String, String>> fileList = new ArrayList<>();
		for (int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();// 사진 원래 이름
			Map<String, String> map = new HashMap<>();
			if (originFile.length() >= 1) {
				System.out.println(i + "번째 사진" + originFile + " 글자수 :" + originFile.length());
				String ext = originFile.substring(originFile.lastIndexOf(".")); // 확장자
				String changeFile = UUID.randomUUID().toString() + ext; // 이름 숫자열덤 +확장자
				// 데이터포맷을 년월일시분초로 가공
				map.put("originFile", originFile);
				map.put("changeFile", changeFile);
				GoodsPhotosDTO gps = new GoodsPhotosDTO();
				if (i == 0) {
					// 1st 사진은 goods에 저장
					goods.setG_origin_name(originFile);
					goods.setG_file_name(changeFile);
					goods.setG_file_path(UPLOAD_PATH + "goods\\" + changeFile);
				} else if (i > 0 && i <= 4) {
					// 2~5 goodsphoto 저장
					gps.setGp_origin_name(originFile);
					gps.setGp_file_name(changeFile);
					gps.setGp_file_path(UPLOAD_PATH + "goods\\" + changeFile);
					goodsPhotoList.add(gps); // 리스트
				} else if (i > 4 && i <= 9) {
					gps.setGp_origin_name(originFile);
					gps.setGp_file_name(changeFile);
					gps.setGp_file_path(UPLOAD_PATH + "goods\\" + changeFile);
					detailPhotoList.add(gps); // 리스트
				}
			}
			fileList.add(map);
		}
		try {
			for (int i = 0; i < multiFileList.size(); i++) {
				if (!fileList.get(i).isEmpty()) {
					File uploadFile = new File(UPLOAD_PATH + "goods\\" + fileList.get(i).get("changeFile"));
					multiFileList.get(i).transferTo(uploadFile);
				}
			}
		} catch (IllegalStateException | IOException e) {
			for (int i = 0; i < multiFileList.size(); i++) {
				if (!fileList.get(i).isEmpty()) {
					new File(UPLOAD_PATH + "goods\\" + fileList.get(i).get("changeFile")).delete();
				}
			}
			e.printStackTrace();
		}
		return "result";
	}
}