package com.locnv.Model;

public class NewCategory extends Abstract<NewCategory>{
	private long ID;
	private String Name;
	private String Title;
	private long ParentID;
	private int DisplayOrder;
	private String SeoTitle;
	private String MetaKeyword;
	private String MetaDescription;
	private boolean ShowOnHome;
	private boolean Status;
	public long getID() {
		return ID;
	}
	public void setID(long iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public long getParentID() {
		return ParentID;
	}
	public void setParentID(long parentID) {
		ParentID = parentID;
	}
	public int getDisplayOrder() {
		return DisplayOrder;
	}
	public void setDisplayOrder(int displayOrder) {
		DisplayOrder = displayOrder;
	}
	public String getSeoTitle() {
		return SeoTitle;
	}
	public void setSeoTitle(String seoTitle) {
		SeoTitle = seoTitle;
	}
	public String getMetaKeyword() {
		return MetaKeyword;
	}
	public void setMetaKeyword(String metaKeyword) {
		MetaKeyword = metaKeyword;
	}
	public String getMetaDescription() {
		return MetaDescription;
	}
	public void setMetaDescription(String metaDescription) {
		MetaDescription = metaDescription;
	}
	public boolean isShowOnHome() {
		return ShowOnHome;
	}
	public void setShowOnHome(boolean showOnHome) {
		ShowOnHome = showOnHome;
	}
	public boolean isStatus() {
		return Status;
	}
	public void setStatus(boolean status) {
		Status = status;
	}
}
