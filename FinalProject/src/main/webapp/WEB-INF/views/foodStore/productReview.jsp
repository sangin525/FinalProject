<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="reviewCount" id="review">
					<div>
						<p>후기</p>
						<p>n개</p>
					</div>
					<button type="button" class="reviewEnroll" id="myBtn">후기
						작성</button>
				</div>
				<div id="myModal" class="modal">
					<form>
						<div class="modal-content">
							<div class="review-content">
								<div class="content-column">
									<label for="star" class="form-label"> 별점을 체크해주세요 <span
										class="textis-requied">*</span>
									</label>
									<div class="star-div">
										<div class="rating-container">
											<!-- 컨테이너 추가 -->
											<div class="rating">
												<i class="rating__star far fa-star"></i> <i
													class="rating__star far fa-star"></i> <i
													class="rating__star far fa-star"></i> <i
													class="rating__star far fa-star"></i> <i
													class="rating__star far fa-star"></i>
											</div>
											<span class="rating__result" id="star" name="star"></span>
										</div>
										<input type="hidden" id="ratingValue" name="rating">
									</div>
								</div>
							</div>
							<div class="review-content">
								<div class="content-column">
									<div class="textarea-box">
										<div class="column-text">
											<label for="content" class="form-label"> 후기를 작성해주세요.
												<span class="textis-requied">*</span>
											</label>
											<textarea class="review-area" id="content" name="content"
												required></textarea>
											<span class="text-muted">(0/500)</span>
										</div>
									</div>
								</div>
							</div>
							<div class="review-content">
								<div class="content-column">
									<label for="photo" class="form-label"> ADD SOME
										PHOTO(선택사항)</label>
									<div class="file-input-container">
										<div id="previewContainer">
											<div class="imageContainer"></div>
											<label for="fileUpload1" class="custom-file-upload">
												<img src="/resources/uploads/더하기.png" alt="Upload"
												style="padding-top: 14px; width: 100px; height: 64px;">
											</label> <input type="file" id="fileUpload1" name="reviewPhoto1"
												accept='image/*' class="file-upload-input" /> <label
												for="fileUpload2" class="custom-file-upload"> <img
												src="/resources/uploads/더하기.png" alt="Upload"
												style="padding-top: 14px; width: 100px; height: 64px;">
											</label> <input type="file" id="fileUpload2" name="reviewPhoto2"
												accept='image/*' class="file-upload-input" /> <label
												for="fileUpload3" class="custom-file-upload"> <img
												src="/resources/uploads/더하기.png" alt="Upload"
												style="padding-top: 14px; width: 100px; height: 64px;">
											</label> <input type="file" id="fileUpload3" name="reviewPhoto3"
												accept='image/*' class="file-upload-input" /> <label
												for="fileUpload4" class="custom-file-upload"> <img
												src="/resources/uploads/더하기.png" alt="Upload"
												style="padding-top: 14px; width: 100px; height: 64px;">
											</label> <input type="file" id="fileUpload4" name="reviewPhoto4"
												accept='image/*' class="file-upload-input" /> <label
												for="fileUpload5" class="custom-file-upload"> <img
												src="/resources/uploads/더하기.png" alt="Upload"
												style="padding-top: 14px; width: 100px; height: 64px;">
											</label> <input type="file" id="fileUpload5" name="reviewPhoto5"
												accept='image/*' class="file-upload-input" />
										</div>
									</div>
									<p class="img-p">• 최대 5개까지 첨부하실 수 있습니다.</p>
									<p class="img-p">• 첨부가능 파일 : jpg, png, gif, jpeg (용량 5MB)</p>
								</div>
							</div>
							<div class="reviewEnroll-btn">
								<button>작성</button>
								<button class="close">취소</button>
							</div>
						</div>
					</form>
				</div>
				<div class="reviewContainer">
					<div class="review-list">
						<ul class="review-ul">
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
							<li class="review-li">
								<div class="review-top">
									<span>닉네임</span>
									<div>
										<span>별점</span> <span>작성날짜</span>
									</div>
								</div>
								<div class="review-imgbox">
									<img src="/resources/uploads/고양이그림.png"
										style="width: 100px; height: 100px;">
								</div>
								<div class="review-item">
									<p class="rv-content">후기내용</p>
								</div>
							</li>
						</ul>
						<div class="moreReviews">
							<a>5/10</a>
						</div>
					</div>
				</div>