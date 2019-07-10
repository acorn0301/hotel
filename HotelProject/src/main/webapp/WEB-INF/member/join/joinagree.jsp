<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/yeStyle.css">
<script src="js/yeScript.js"></script>
<script src="https://kit.fontawesome.com/073cb107c5.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	
	 // 체크박스 전체선택, 전체 해제
	function checkAll(){
      if( $("#chk_all").is(':checked') ){
        $("input[class=chk]").prop("checked", true);
      }else{
        $("input[class=chk]").prop("checked", false);
      }
	} 

	$("#termsService").click(function() {
		viewTerms();
	})

	$("#termsPrivacy").click(function() {
		viewTerms();
	})

	$("#termsEmail").click(function() {
		viewTerms();
	})


	function viewTerms() {
		if (!$("#termsService").is(":checked") || !$("#termsPrivacy").is(":checked") || !$("#termsEmail").is(":checked")) {
			$("#chk_all").prop("checked", false);
		}

		if ($("#termsService").is(":checked") && $("#termsPrivacy").is(":checked") && $("#termsEmail").is(":checked")) {
			$("#chk_all").prop("checked", true);
		}
		return true;
	}

	function checkTerms() {
		var res = true;

		if ($("#termsService").is(":checked") == false || $("#termsPrivacy").is(":checked") == false) {
			$("#agreeMsg").show();
			res = false;
		} else {
			$("#agreeMsg").hide();
		}

		return res;
	}
	
	
	function submitAgree() {
		if (checkTerms() != true) {
			return false;
		}

		location.href = "join.do";
		return true;
	}

	function submitDisagree() {
		location.href = "home.do";
		return true;
	}

	$("#btnCancel").click(function(event) {
		clickcr(this, 'tos.disagree', '', '', event);
		submitDisagree();
		return false;
	})

	$("#btnAgree").click(function(event) {
		clickcr(this, 'tos.agree', '', '', event);
		submitAgree();
		return false;
	})
	
</script>


<div id="joinagree">
<div class="headTit">
	<h2 class="tit">회원가입&nbsp;&nbsp;<i class="fas fa-user-plus"></i></h2>
</div>
<br>
	<form class="form-inline" action="join.do" method="post" id="join_agree" onsubmit="submitAgree();">
			
			<!-- 약관동의 -->
			<div class="terms_p">
				<p class="terms_chk_all">
					<span class="input_chk"> 
						<input type="checkbox" id="chk_all" name="chk_all" onclick="checkAll();"> 
						<label for="chk_all">
							<span class="chk_all_txt">
							이용약관, 개인정보 수집 및 이용, <br>프로모션 안내 메일 수신 (선택)에 모두 동의합니다.
							</span>
						</label>
					</span>
				</p>

				<ul class="terms_bx_list">
				
					<li class="terms_bx">
					<span class="input_chk"> 
					<input type="checkbox" id="termsService" name="termsService" class="chk">
					<label for="termsService">1st Hotel 이용약관 동의<span class="terms_necessary"> (필수)</span></label></span>
						<div class="terms_box" tabindex="0" id="divService">
							
							<!-- 1st Hotel 이용약관 동의 -->
							<div class="article">
								<h5 class="article__title">여러분을 환영합니다.</h5>
								<p class="article__text">1st Hotel 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 
									본 약관은 다양한 1st Hotel 서비스의 이용과 관련하여 1st Hotel 서비스를 제공하는 1st Hotel 주식회사(이하
									‘1st Hotel’)와 이를 이용하는 1st Hotel 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의
									1st Hotel 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.</p>
								<p class="article__text">1st Hotel 서비스를 이용하시거나 1st Hotel 서비스 회원으로 가입하실
									경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐
									주시기 바랍니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">다양한 1st Hotel 서비스를 즐겨보세요.</h5>
								<p class="article__text">
									1st Hotel은 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 호텔 검색,호텔 예약,룸서비스,
									커뮤니케이션, 다양한 콘텐츠 제공, 상품 주문 등 여러분의 휴식에 편리함을 더할 수 있는 다양한 서비스를 제공하고
									있습니다.
									<br> 
									여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 1st Hotel 서비스를 자유롭게 이용하실 수 있으며, 
									개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 1st Hotel 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.
								</p>
								<p class="article__text">1st Hotel 서비스에는 기본적으로 본 약관이 적용됩니다만 1st Hotel가
									다양한 서비스를 제공하는 과정에서 부득이 본 약관 외 별도의 약관, 운영정책 등을 적용하는 경우가 있습니다. 
									그리고 1st Hotel 계열사가 제공하는 특정 서비스의 경우에도 해당 운영 회사가 정한 고유의 약관, 운영정책 등이 적용될 수 있습니다. 
									이러한 내용은 각각의 해당 서비스 초기 화면에서 확인해 주시기 바랍니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">회원으로 가입하시면 1st Hotel 서비스를 보다 편리하게 이용할 수 있습니다.</h5>
								<p class="article__text">
									여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 1st Hotel는 이에 대한 승낙을 통해 회원 가입
									절차를 완료하고 여러분께 1st Hotel 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 
									계정이란 회원이 1st Hotel 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다.
									회원은 자신의 계정을 통해 좀더 다양한 1st Hotel 서비스를 보다 편리하게 이용할 수 있습니다. 
									이와 관련한 상세한 내용은 <em>계정 운영정책</em> 및 고객센터 내 1st Hotel 회원가입 방법 등에서 확인해 주세요.
								</p>
							</div>
							<div class="article">
								<h5 class="article__title">여러분의 개인정보를 소중히 보호합니다.</h5>
								<p class="article__text">
									1st Hotel은 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보
									보호 관련 법령에 따라 안전하게 관리합니다. 1st Hotel가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기
									위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침 에서 확인하실 수 있습니다.
								</p>
								<p class="article__text">1st Hotel은 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인
									혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해
									드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가
									부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">1st Hotel 서비스 이용과 관련하여 몇 가지 주의사항이
									있습니다.</h5>
								<p class="article__text">1st Hotel은 여러분이 1st Hotel 서비스를 자유롭고 편리하게 이용할 수
									있도록 최선을 다하고 있습니다. 다만, 여러분이 1st Hotel 서비스를 보다 안전하게 이용하고 1st Hotel 서비스에서 여러분과
									타인의 권리가 서로 존중되고 보호받으려면 여러분의 도움과 협조가 필요합니다. 여러분의 안전한 서비스 이용과 권리
									보호를 위해 부득이 아래와 같은 경우 여러분의 게시물 게재나 1st Hotel 서비스 이용이 제한될 수 있으므로, 이에 대한
									확인 및 준수를 요청 드립니다.</p>
								<ul class="article__text">
									<li class="article__text__list">회원 가입 시 이름, 생년월일, 휴대전화번호
										등의 정보를 허위로 기재해서는 안 됩니다. 회원 계정에 등록된 정보는 항상 정확한 최신 정보가 유지될 수 있도록
										관리해 주세요. 자신의 계정을 다른 사람에게 판매, 양도, 대여 또는 담보로 제공하거나 다른 사람에게 그 사용을
										허락해서는 안 됩니다. 아울러 자신의 계정이 아닌 타인의 계정을 무단으로 사용해서는 안 됩니다. 이에 관한
										상세한 내용은 <em>계정 운영정책</em>을 참고해 주시기 바랍니다.
									</li>
									<li class="article__text__list">타인에 대해 직접적이고 명백한 신체적 위협을
										가하는 내용의 게시물, 타인의 자해 행위 또는 자살을 부추기거나 권장하는 내용의 게시물, 타인의 신상정보,
										사생활 등 비공개 개인정보를 드러내는 내용의 게시물, 타인을 지속적으로 따돌리거나 괴롭히는 내용의 게시물,
										성매매를 제안, 알선, 유인 또는 강요하는 내용의 게시물, 공공 안전에 대해 직접적이고 심각한 위협을 가하는
										내용의 게시물은 제한될 수 있습니다.</li>
									<li class="article__text__list">관련 법령상 금지되거나 형사처벌의 대상이 되는
										행위를 수행하거나 이를 교사 또는 방조하는 등의 범죄 관련 직접적인 위험이 확인된 게시물, <span
										class="article__text">관련 법령에서 홍보, 광고, 판매 등을 금지하고 있는 물건
											또는 서비스를 홍보, 광고, 판매하는 내용의 게시물,</span> 타인의 지식재산권 등을 침해하거나 모욕, 사생활 침해
										또는 명예훼손 등 타인의 권리를 침해하는 내용이 확인된 게시물은 제한될 수 있습니다.
									</li>
									<li class="article__text__list">자극적이고 노골적인 성행위를 묘사하는 등
										타인에게 성적 수치심을 유발시키거나 왜곡된 성 의식 등을 야기할 수 있는 내용의 게시물, 타인에게 잔혹감 또는
										혐오감을 일으킬 수 있는 폭력적이고 자극적인 내용의 게시물, <span class="article__text">본인
											이외의 자를 사칭하거나 허위사실을 주장하는 등 타인을 기만하는 내용의 게시물,</span> 과도한 욕설, 비속어 등을
										계속하여 반복적으로 사용하여 심한 혐오감 또는 불쾌감을 일으키는 내용의 게시물은 제한될 수 있습니다.
									</li>
									<li class="article__text__list">자동화된 수단을 활용하는 등 1st Hotel 서비스의
										기능을 비정상적으로 이용하여 게재된 게시물, 1st Hotel 각 개별 서비스의 제공 취지와 부합하지 않는 내용의 게시물은
										다른 이용자들의 정상적인 1st Hotel 서비스 이용에 불편을 초래하고 더 나아가 1st Hotel의 원활한 서비스 제공을
										방해하므로 역시 제한될 수 있습니다. 기타 제한되는 게시물에 관한 상세한 내용은 <em>게시물 운영정책</em>
										및 각 개별 서비스에서의 약관, 운영정책 등을 참고해 주시기 바랍니다.
									</li>
									<li class="article__text__list"><span
										class="article__text">1st Hotel의 사전 허락 없이 자동화된 수단(예: 매크로
											프로그램, 로봇(봇), 스파이더, 스크래퍼 등)을 이용하여 1st Hotel 서비스 회원으로 가입을 시도 또는
											가입하거나, 1st Hotel 서비스에 로그인을 시도 또는 로그인하거나, 1st Hotel 서비스 상에 게시물을 게재하거나, 
											1st Hotel 서비스를 통해 커뮤니케이션하거나(예: 전자메일, 쪽지 등),</span> 1st Hotel 서비스에 게재된 회원의 아이디(ID),
										게시물 등을 수집하거나, 1st Hotel 검색 서비스에서 특정 질의어로 검색하거나 혹은 그 검색결과에서 특정 검색결과를
										선택(이른바 ‘클릭’)하는 등 <span class="article__text">이용자(사람)의
											실제 이용을 전제로 하는 1st Hotel 서비스의 제공 취지에 부합하지 않는 방식으로 1st Hotel 서비스를 이용하거나 이와
											같은 1st Hotel 서비스에 대한 어뷰징(남용) 행위를 막기 위한 1st Hotel의 기술적 조치를 무력화하려는 일체의 행위</span>(예:
										IP를 지속적으로 바꿔가며 접속하는 행위, Captcha를 외부 솔루션 등을 통해 우회하거나 무력화 하는 행위
										등)를 시도해서는 안 됩니다.</li>
									<li class="article__text__list"><span
										class="article__text">1st Hotel의 동의 없이 자동화된 수단에 의해 1st Hotel 서비스 상에
											광고가 게재되는 영역 또는 그 밖의 영역에 부호, 문자, 음성, 음향, 그림, 사진, 동영상, 링크 등으로
											구성된 각종 콘텐츠 자체 또는 파일을 삽입</span>해서는 안 됩니다. 또한, 1st Hotel 서비스 또는 이에 포함된
										소프트웨어를 복사, 수정할 수 없으며, 이를 판매, 양도, 대여 또는 담보로 제공하거나 타인에게 그 이용을
										허락해서는 안 됩니다. 1st Hotel 서비스에 포함된 소프트웨어를 역 설계, 소스코드 추출 시도, 복제, 분해, 모방,
										기타 변형하는 등의 행위도 금지됩니다(다만, 오픈소스에 해당되는 경우 그 자체 조건에 따릅니다). <span
										class="article__text">그 밖에 바이러스나 기타 악성 코드를 업로드하거나 1st Hotel
											서비스의 원활한 운영을 방해할 목적으로 서비스 기능을 비정상적으로 이용하는 행위</span> 역시 금지됩니다.</li>
								</ul>
								<p class="article__text">1st Hotel은 본 약관의 범위 내에서 게시물 운영정책, 각 개별
									서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게
									안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다
									구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기
									바랍니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">부득이 서비스 이용을 제한할 경우 합리적인 절차를
									준수합니다.</h5>
								<p class="article__text">1st Hotel는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히
									다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별
									서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수
									있습니다. 다만, 이것이 1st Hotel이 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다.</p>
								<p class="article__text">또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책,
									각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 1st Hotel는 여러분의 관련 행위 내용을 확인할 수
									있으며, 그 확인 결과에 따라 1st Hotel 서비스 이용에 대한 주의를 당부하거나, 1st Hotel 서비스 이용을 일부 또는
									전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더
									이상 1st Hotel 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수
									있습니다.</p>
								<p class="article__text">부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령
									위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한
									원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스
									이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기
									바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기
									바랍니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">1st Hotel의 잘못은 1st Hotel가 책임집니다.</h5>
								<p class="article__text">1st Hotel는 여러분이 1st Hotel 서비스를 이용함에 있어 1st Hotel의 고의
									또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에
									준하는 불가항력으로 인하여 1st Hotel가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할
									수 없어 발생한 손해에 대해서 1st Hotel는 책임을 부담하지 않습니다.</p>
								<p class="article__text">그리고 1st Hotel가 손해배상책임을 부담하는 경우에도 통상적으로
									예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에
									특별한 규정이 없는 한 책임을 부담하지 않습니다.</p>
								<p class="article__text">한편, 1st Hotel 서비스를 매개로 한 여러분과 다른 회원 간 또는
									여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의
									콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 1st Hotel는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다.
								</p>
							</div>
							<div class="article">
								<h5 class="article__title">언제든지 1st Hotel 서비스 이용계약을 해지하실 수 있습니다.</h5>
								<p class="article__text">1st Hotel에게는 참 안타까운 일입니다만, 회원은 언제든지 1st Hotel
									서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 1st Hotel는 관련 법령 등이 정하는 바에 따라
									이를 지체 없이 처리하겠습니다.</p>
								<p class="article__text">1st Hotel 서비스 이용계약이 해지되면, 관련 법령 및
									개인정보처리방침에 따라 1st Hotel가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된
									게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른
									회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지
									신청 이전에 삭제하신 후 탈퇴하시기 바랍니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">일부 1st Hotel 서비스에는 광고가 포함되어 있습니다.</h5>
								<p class="article__text">여러분이 다양한 1st Hotel 서비스를 이용하다 보면 간혹 일부 개별
									서비스에 광고가 포함된 경우가 있습니다. 1st Hotel 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신
									통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시
									여러분이 부담합니다.</p>
								<p class="article__text">
									<span class="article__text">원하는 1st Hotel 서비스를 이용하기 위해 원하지 않는
										광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 1st Hotel 서비스를 원칙적으로 무료로 제공할 수
										있게 해주는 데 기여하며, 더 나아가 1st Hotel가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이
										됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는
										관행이 이를 뒷받침합니다. </span>
								</p>
								<p class="article__text">1st Hotel는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는
									방법에 대해 항상 고민하고 개선해 나가겠습니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">서비스 중단 또는 변경 시 꼭 알려드리겠습니다.</h5>
								<p class="article__text">1st Hotel는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기
									위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상
									상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다.</p>
								<p class="article__text">한편, 1st Hotel는 서비스 운영 또는 개선을 위해 상당한 필요성이
									있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는
									일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다.</p>
								<p class="article__text">이 경우 1st Hotel는 예측 가능한 경우 상당기간 전에 이를
									안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의
									경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀
									기울이겠습니다.</h5>
								<p class="article__text">
									1st Hotel는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는
									경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원
									전체에 대한 통지가 필요할 경우엔 7일 이상  1st Hotel 도메인의 웹사이트 및
									응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다.
								</p>
								<p class="article__text">1st Hotel는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은
									언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 1st Hotel는 합리적 범위 내에서
									가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며
									사전 공지 후 개정합니다.</h5>
								<p class="article__text">1st Hotel는 본 약관의 내용을 여러분이 쉽게 확인할 수 있도록
									서비스 초기 화면에 게시하고 있습니다.</p>
								<p class="article__text">1st Hotel는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수
									있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스
									내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에
									해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.</p>
								<p class="article__text">1st Hotel는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지
									약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 1st Hotel에 접수되지 않으면,
									여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 1st Hotel로서는 매우 안타까운
									일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상
									불가능하게 될 수 있습니다.</p>
								<p class="article__text">1st Hotel 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각
									개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다.
									따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한
									경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해
									주시기 바랍니다.</p>
								<p class="article__text">
									1st Hotel 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터로 문의 주시기 바랍니다.
								</p>
							</div>
						</div></li>
						
					<li class="terms_bx">
					<span class="input_chk"> 
					<input type="checkbox" id="termsPrivacy" name="termsPrivacy" class="chk">
						<label for="termsPrivacy" class="collect_personal">
							개인정보 수집 및 이용에 대한 안내<span class="terms_necessary"> (필수)</span>
						</label> 
					</span>
					
						<div class="terms_box" tabindex="0" id="divPrivacy">
							<!-- 개인정보 수집 및 이용에 대한 안내 -->
							<div class="policy_summary">
								<p class="policy_summary__text">정보통신망법 규정에 따라 1st Hotel에 회원가입
									신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내
									드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p>
							</div>
							<div class="article">
								<h5 class="article__title">1. 수집하는 개인정보</h5>
								<p class="article__text">이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등
									대부분의 1st Hotel 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이
									개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 1st Hotel는 서비스 이용을 위해 필요한 최소한의
									개인정보를 수집합니다.</p>
								<div class="clause">
									<h5 class="clause__title">회원가입 시점에 1st Hotel가 이용자로부터 수집하는 개인정보는
										아래와 같습니다.</h5>
									<ul class="sections">
										<li class="sections__section">- 회원 가입 시에 ‘아이디, 비밀번호, 이름,
											생년월일, 성별, 가입인증 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세
											미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI),
											휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.</li>
										<li class="sections__section">- 단체아이디로 회원가입 시 단체아이디,
											비밀번호, 단체이름, 이메일주소, 가입인증 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을
											선택항목으로 수집합니다.</li>
									</ul>
									<h5 class="clause__title">서비스 이용 과정에서 이용자로부터 수집하는 개인정보는
										아래와 같습니다.</h5>
									<p class="clause__text">NAVER 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청
										과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할
										경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적,
										개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.</p>
									<h5 class="clause__title">서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용
										기록, 기기정보, 위치정보가 생성되어 수집될 수 있습니다.</h5>
									<p class="clause__text">
										구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여
										이를 저장(수집)하거나, <br> 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못 하도록
										안전하게 변환한 후에 수집하는 경우를 의미합니다.<br> 1st Hotel 위치기반서비스 이용 시 수집·저장되는
										위치정보의 이용 등에 대한 자세한 사항은 ‘1st Hotel 위치정보 이용약관’에서 규정하고 있습니다.
									</p>
								</div>
							</div>
							<div class="article">
								<h5 class="article__title">2. 수집한 개인정보의 이용</h5>
								<p class="article__text">1st Hotel 및 1st Hotel 관련 제반 서비스(모바일 웹/앱 포함)의
									회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.</p>
								<ul class="sections">
									<li class="sections__section">- 회원 가입 의사의 확인, 연령 확인 및
										법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를
										위하여 개인정보를 이용합니다.</li>
									<li class="sections__section">- 콘텐츠 등 기존 서비스 제공(광고 포함)에
										더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성,
										지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여
										개인정보를 이용합니다.</li>
									<li class="sections__section">- 법령 및 1st Hotel 이용약관을 위반하는 회원에 대한
										이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재,
										계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자
										보호 및 서비스 운영을 위하여 개인정보를 이용합니다.</li>
									<li class="sections__section">- 유료 서비스 제공에 따르는 본인인증, 구매 및
										요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.</li>
									<li class="sections__section">- 이벤트 정보 및 참여기회 제공, 광고성 정보
										제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.</li>
									<li class="sections__section">- 서비스 이용기록과 접속 빈도 분석, 서비스
										이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.</li>
									<li class="sections__section">- 보안, 프라이버시, 안전 측면에서 이용자가
										안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.</li>
								</ul>
							</div>
							<div class="article">
								<h5 class="article__title">3. 개인정보의 파기</h5>
								<div class="clause">
									<h5 class="clause__title">회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시
										지체없이 파기하고 있습니다.</h5>
									<p class="clause__text">단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은
										경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게
										보관합니다.</p>
								</div>
								<div class="clause">
									<h5 class="clause__title">이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은
										경우는 아래와 같습니다.</h5>
									<p class="clause__text">
										부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고
										파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인
										DI)가 있습니다.<br> 부정이용으로 징계를 받기 전에 회원 가입 및 탈퇴를 반복하며 서비스를 부정 이용하는
										사례를 막기 위해 탈퇴한 이용자의 휴대전화번호를 복호화가 불가능한 일방향 암호화(해시 처리)하여 6개월간
										보관합니다. QR코드 서비스에서 연락처를 등록한 이후 QR코드 삭제 시, 복구 요청 대응을 위해 삭제 시점으로
										부터 6개월 보관합니다. 스마트 플레이스 서비스에서 휴대전화번호를 등록한 경우 분쟁 조정 및 고객문의 등을
										목적으로 업체 등록/수정 요청시, 또는 등록 이후 업체 삭제 요청 시로부터 최대 1년간 보관 할 수 있습니다.
									</p>
								</div>
								<div class="clause">
									<h5 class="clause__title">전자상거래 등에서의 소비자 보호에 관한 법률,
										전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. 1st Hotel는 이
										기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.</h5>
									<ul class="sections">
										<li class="sections__section">- 전자상거래 등에서 소비자 보호에 관한 법률 <br>계약
											또는 청약철회 등에 관한 기록: 5년 보관 <br>대금결제 및 재화 등의 공급에 관한 기록: 5년
											보관 <br>소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
										</li>
										<li class="sections__section">- 전자금융거래법 <br>전자금융에 관한
											기록: 5년 보관
										</li>
										<li class="sections__section">- 통신비밀보호법 <br>로그인 기록:
											3개월
										</li>
									</ul>
									<p class="clause__text">
										회원탈퇴, 서비스 종료, 이용자에게 동의받은 개인정보 보유기간의 도래와 같이 개인정보의 수집 및 이용목적이
										달성된 개인정보는 재생이 불가능한 방법으로 파기하고 있습니다. 법령에서 보존의무를 부과한 정보에 대해서도 해당
										기간 경과 후 지체없이 재생이 불가능한 방법으로 파기합니다. 전자적 파일 형태의 경우 복구 및 재생이 되지
										않도록 기술적인 방법을 이용하여 안전하게 삭제하며, 출력물 등은 분쇄하거나 소각하는 방식 등으로 파기합니다.<br>

										참고로 1st Hotel는 ‘개인정보 유효기간제’에 따라 1년간 서비스를 이용하지 않은 회원의 개인정보를 별도로 분리
										보관하여 관리하고 있습니다.
									</p>
								</div>
							</div>
						</div></li>
						
					<li class="terms_bx">
					<span class="input_chk"> 
						<input type="checkbox" id="termsEmail" name="termsEmail" value="Y" class="chk"> 
						<label for="termsEmail">이벤트 등 프로모션 알림 메일 수신<span class="terms_choice terms_no"> (선택)</span></label>
					</span>
					<br>
					</li>
				</ul>
				
			<span class="error" id="agreeMsg" style="display: none;">1st Hotel 이용약관과 개인정보 수집 및 이용에 대한 안내 모두 동의해주세요.</span>
			</div>
			
			<!-- //약관동의 -->
			<a name="agreeBottom"></a>
			<div class="btn_area double">
				<span>
					<!-- tg-text=terms_button_cancel -->
					<a href="#" id="btnCancel" class="btn_type btn_default" role="button" onclick="submitDisagree();">비동의</a>
				</span> 
				<span>
					<!-- tg-text=terms_button_agree -->
					<a href="#" id="btnAgree" class="btn_type btn_primary" role="button" onclick="submitAgree();">동의</a>
				</span>
			</div><br>
			
			
		
	</form>
</div>
</body>
</html>
