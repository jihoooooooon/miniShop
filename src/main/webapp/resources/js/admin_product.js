document.addEventListener("DOMContentLoaded", function () {
    // 전체 수정사항 저장 버튼 클릭 시 AJAX 요청
    document.getElementById('save-all').addEventListener('click', function() {
        var products = [];

        // 각 행의 데이터를 배열에 저장
        var rows = document.querySelectorAll('#customers tr');
        rows.forEach(function(row) {
            var nameInput = row.querySelector('.name');
            var brandInput = row.querySelector('.brand');
            var typeInput = row.querySelector('.type');
            var priceInput = row.querySelector('.price');

            if (nameInput && nameInput.dataset.id) {
                var p_id = nameInput.dataset.id;
                var name = nameInput.value;
                var brand = brandInput.value;
                var type = typeInput.value;
                var price = priceInput.value;

                products.push({
                    p_id: p_id,
                    name: name,
                    brand: brand,
                    type: type,
                    price: price
                });
            }
        });

        // AJAX 요청으로 모든 상품 수정 데이터 전송
        var xhr = new XMLHttpRequest();
        xhr.open('POST', '/ex/admin/updateProduct', true);
        xhr.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    alert('모든 상품이 수정되었습니다.');
                } else {
                    alert('상품 수정에 실패하였습니다.');
                }
            }
        };
        xhr.send(JSON.stringify(products));
    });
  });



document.addEventListener("DOMContentLoaded", function () {
    const rowsPerPage = 6; // 페이지당 표시할 행 수
    const tableBody = document.querySelector("#customers tbody"); // #customers
																	// 선택
    const rows = tableBody.querySelectorAll("tr");
    const pageCount = Math.ceil(rows.length / rowsPerPage);
    const pagination = document.getElementById("pageProductNumbers"); // ID 수정

    let currentPage = 1;

    function displayPage(page) {
        // 모든 행을 숨기고 현재 페이지에 해당하는 행만 표시
        rows.forEach((row, index) => {
            row.style.display = (index >= (page - 1) * rowsPerPage && index < page * rowsPerPage) ? "" : "none";
        });
    }

    function updatePagination() {
        pagination.innerHTML = "";

        for (let i = 1; i <= pageCount; i++) {
            const pageButton = document.createElement("button");
            pageButton.textContent = i;
            pageButton.onclick = function () {
                currentPage = i;
                displayPage(currentPage);
                updatePagination();
            };
            if (i === currentPage) {
                pageButton.style.fontWeight = "bold"; // 현재 페이지 굵게 표시
            }
            pagination.appendChild(pageButton);
        }

        // 이전 및 다음 버튼 상태 업데이트
        document.getElementById("prevProduct").disabled = currentPage === 1;
        document.getElementById("nextProductPage").disabled = currentPage === pageCount;
    }

    // 이전 페이지로 이동
    document.getElementById("prevProduct").addEventListener("click", function () {
        if (currentPage > 1) {
            currentPage--;
            displayPage(currentPage);
            updatePagination();
        }
    });

    // 다음 페이지로 이동
    document.getElementById("nextProductPage").addEventListener("click", function () {
        if (currentPage < pageCount) {
            currentPage++;
            displayPage(currentPage);
            updatePagination();
        }
    });

    // 처음 페이지로 이동
    document.getElementById("firstProduct").addEventListener("click", function () {
        currentPage = 1;
        displayPage(currentPage);
        updatePagination();
    });

    // 마지막 페이지로 이동
    document.getElementById("lastProductPage").addEventListener("click", function () {
        currentPage = pageCount;
        displayPage(currentPage);
        updatePagination();
    });

    // 초기 페이지 표시 및 버튼 상태 업데이트
    displayPage(currentPage);
    updatePagination();
});
