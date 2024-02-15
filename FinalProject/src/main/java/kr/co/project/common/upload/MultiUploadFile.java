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
import kr.co.project.member.model.dto.MemberDTO;
import kr.co.project.recipe.model.dto.RecipeDTO;

public class MultiUploadFile {



	private static final String UPLOAD_PATH="C:\\Users\\pje97\\git\\finalProject\\FinalProject\\src\\main\\webapp\\resources\\uploads\\";	
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
}