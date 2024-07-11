package com.mall.table.vo;

public class CartInfoVO {
		private String userId;
		private String goodsCd;
		private String buyQty;
		private String regDt;
		
		//추가컬럼
		private String sellPrice;
		private String thumnailUrl;
		private String goodsName;
		
		
		
		public String getSellPrice() {
			return sellPrice;
		}
		public void setSellPrice(String sellPrice) {
			this.sellPrice = sellPrice;
		}
		public String getThumnailUrl() {
			return thumnailUrl;
		}
		public void setThumnailUrl(String thumnailUrl) {
			this.thumnailUrl = thumnailUrl;
		}
		public String getGoodsName() {
			return goodsName;
		}
		public void setGoodsName(String goodsName) {
			this.goodsName = goodsName;
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getGoodsCd() {
			return goodsCd;
		}
		public void setGoodsCd(String goodsCd) {
			this.goodsCd = goodsCd;
		}
		public String getBuyQty() {
			return buyQty;
		}
		public void setBuyQty(String buyQty) {
			this.buyQty = buyQty;
		}
		public String getRegDt() {
			return regDt;
		}
		public void setRegDt(String regDt) {
			this.regDt = regDt;
		}
		
		
}
