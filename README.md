# back-end

[프로젝트 BBQ]
23/06/09
> 추가로 구현해볼 내용
> 1. 주문금액이 쌓이면 role을 변경할 수 있도록(= 멤버십 레벨이 상승)하는 로직
>    -> 그러기 위해서는 먼저 member 테이블에 컬럼값으로 총 결제금액을 추가해야 함
>
> 2. 결제 로직
>    -> 실제 계좌정보는 사용할 수 없으니 최종결제 금액만 확인할 수 있도록
> 3. 결제 시 포인트 사용 로직
>
> 4. 쿠폰 발급 로직
>    -> 멤버십 별 차별적 쿠폰 발급도 가능
> 5. 결제 시 쿠폰 적용 로직
>
> 6. 장바구니 로직 
>    -> DB에 넣기 전에 자바빈에만 담아서 사용하는 방식?
>    -> 이후 DB에 담을때는 ArrayList를 이용해서 장바구니 안에 담긴 모든 주문내역 저장
