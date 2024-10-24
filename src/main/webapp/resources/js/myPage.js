function showSection(sectionId, clickedElement) {
    // 모든 섹션 숨기기
    document.getElementById('mysInfo').style.display = 'none';
    document.getElementById('changePass').style.display = 'none';
    document.getElementById('deleteUser').style.display = 'none';
    
    // 모든 탭 비활성화
    var tabs = document.querySelectorAll('.tab');
    tabs.forEach(function(tab) {
        tab.classList.remove('active');
    });

    // 선택된 섹션 보이기
    document.getElementById(sectionId).style.display = 'block';
    
    // 클릭된 탭 활성화
    clickedElement.classList.add('active');
}

// 주소검색
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 도로명 주소 변수
            var roadAddr = data.roadAddress; 
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            // 주소 정보를 해당 필드에 넣는다.
            document.getElementById("u_address").value = roadAddr;
        }
    }).open();
}

function validateField(fieldName) {
    let isValid = true;

    // 필드와 값 가져오기
    const field = document.forms["passwordForm"][fieldName];
    const value = field.value;
    const errorSpan = document.getElementById(fieldName + '-error');

    // 패턴 정의
    const pwPattern = /^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[\W_]).{8,20}$/;
    
    // 필드 이름에 따라 필드 값 검사
    if (fieldName === 'u_pw') {
        if (!pwPattern.test(value)) {
            errorSpan.textContent = "비밀번호는 8~20자의 영문, 숫자, 특수문자를 사용해야 합니다.";
            errorSpan.style.color = "red";
            isValid = false;
        } else {
            errorSpan.textContent = '';
        }
    }

    if (fieldName === 'u_pw_check') {
        const pw = document.forms["passwordForm"]["u_pw"].value;
        if (value !== pw) {
            errorSpan.textContent = "비밀번호와 비밀번호 확인이 일치하지 않습니다.";
            errorSpan.style.color = "red";
            errorSpan.classList.remove('correct-message');
            errorSpan.classList.add('error-message');
            isValid = false;
        } else {
            errorSpan.textContent = "비밀번호가 일치합니다.";
            errorSpan.style.margin = "10px 30px";
            errorSpan.style.color = "green";
            errorSpan.classList.remove('error-message');
            errorSpan.classList.add('correct-message');
        }
    }
    
    return isValid;
}

function validateForm() {
    let isValid = true;

    // 각 필드 검사
    const fields = ['u_pw', 'u_pw_check'];
    fields.forEach(function(fieldName) {
        if (!validateField(fieldName)) {
            isValid = false;
        }
    });

    return isValid;
}

// 비밀번호 가리기/보기 기능
function togglePassword(fieldId, buttonId) {
    const passwordField = document.getElementById(fieldId);
    const toggleImg = document.getElementById(buttonId);
    
    if (passwordField.type === "password") {
        passwordField.type = "text";
        toggleImg.src = "/resources/img/close.png"; // 비밀번호가 보일 때 이미지
        toggleImg.alt = "가리기";
    } else {
        passwordField.type = "password";
        toggleImg.src = "/resources/img/open.png"; // 비밀번호가 가려질 때 이미지
        toggleImg.alt = "보기";
    }
}

document.addEventListener('DOMContentLoaded', function() {
    // 처음 페이지에 들어올 때 'mysInfo' 섹션을 보이게 함
    showSection('mysInfo', document.querySelector('.tab.active') || document.querySelector('.tab'));

    const checkbox = document.getElementById('cancel-account-check');
    const label = document.querySelector('.myinfo-checkbox-container label');

    // 체크박스 상태에 따라 라벨 스타일 변경
    function updateLabelStyle() {
        if (checkbox.checked) {
            label.style.color = '#000'; // 체크된 상태에서 라벨의 색상
            label.style.fontWeight = 'bold'; // 체크된 상태에서 폰트 두께
            label.style.fontSize = '18px'; // 체크된 상태에서 폰트 크기
        } else {
            label.style.color = '#666'; // 기본 상태에서 라벨의 색상
            label.style.fontWeight = 'normal'; // 기본 상태에서 폰트 두께
            label.style.fontSize = '16px'; // 기본 상태에서 폰트 크기
        }
    }

    // 초기 상태 적용
    updateLabelStyle();

    // 체크박스 상태가 변경될 때마다 라벨 스타일 업데이트
    checkbox.addEventListener('change', updateLabelStyle);

    // 체크박스와 버튼 요소를 가져옵니다
    const deleteButton = document.getElementById('delete-account-btn');

    // 체크박스의 상태에 따라 버튼 활성화/비활성화
    checkbox.addEventListener('change', function() {
        deleteButton.disabled = !this.checked;
    });
});

// 탈퇴 버튼 클릭 시 확인 메시지 표시
function confirmDelete() {
    // 확인 및 취소 버튼이 있는 메시지 표시
    var confirmed = confirm("정말로 회원 탈퇴를 진행하시겠습니까?");

    // 사용자가 '확인'을 클릭한 경우
    if (confirmed) {
        // 페이지 이동
        location.href = '/ex/user/deactivateDB';
    }
    // 사용자가 '취소'를 클릭하면 아무 작업도 하지 않음
}
