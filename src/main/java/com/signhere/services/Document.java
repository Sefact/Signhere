package com.signhere.services;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.signhere.beans.DocumentBean;
import com.signhere.beans.UserBean;
import com.signhere.beans.WriteBean;
import com.signhere.utils.Session;

@Service
public class Document {
	@Autowired
	SqlSessionTemplate sqlSession;
	ModelAndView mav;
	@Autowired
	Session ssn;
	
	private String uploadPath = "C:\\Company\\Document\\";
	private String signPath = "C:\\Company\\Signature\\";
	
	public List<DocumentBean> mSearchText(DocumentBean db){

		//여기서 sessino에 들어간 cmCode 저장
		try {
			db.setCmCode((String)ssn.getAttribute("cmCode"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		this.handleNullValues(db);
		this.changeDateFormat(db);

		List<DocumentBean> docList;

		System.out.println("dmCode:" + db.getCmCode());
		System.out.println("dmNum:" + db.getDmNum());
		System.out.println("dmwriter:" + db.getDmWriter());
		System.out.println("dmCode:" + db.getDmCode());
		System.out.println("apcode:" + db.getApCode());
		System.out.println("dmtitle:" + db.getDmTitle());
		System.out.println("dmdate:" + db.getDmDate());
		System.out.println("dmdate2:" + db.getDmDate2());
		
		docList = sqlSession.selectList("searchCompletedDocs", db);
		
		return docList;
	}

	

	public List<UserBean> mWriteDraft(UserBean ub) {
		List<UserBean> userList = null;
		
		String apCheck = ub.getApCheck();	
		try {
			ub.setUserId((String) ssn.getAttribute("userId"));
			ub.setDpCode((String) ssn.getAttribute("apCheck"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		/* A=ApprovalLine | D=DepartmentLine | R=ReferenceLine */
		if(apCheck.equals("A")) {
			userList = sqlSession.selectList("selOrgChart", ub);
		} else if(apCheck.equals("D")) {
			userList = sqlSession.selectList("selDepartmentChart", ub);
		} else if(apCheck.equals("R")) {
			userList = sqlSession.selectList("selReferenceChart", ub);
		} else {
			System.out.println("Error");
		}

		return userList;
	}
	
	public ModelAndView mTempDraft(DocumentBean db) {
		mav = new ModelAndView();
		
		// Original (Approval & Document & Reference) Map
		List<Map<String, Object>> ogAplMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> ogDocMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> ogRefMap = new ArrayList<Map<String, Object>>();	

		int apSeqLoc = db.getAplSeq();
		
		for(int i=0; i<db.getRfBean().size(); i++) {
			Map<String, Object> ogRefMapPut = new HashMap<String, Object>();
			ogRefMapPut.put("rdId", db.getRfBean().get(i).getRdId());
			ogRefMapPut.put("rdName", db.getRfBean().get(i).getRdName());
			ogRefMap.add(ogRefMapPut);
		}
		
		for(int i=0; i<apSeqLoc; i++) {
			Map<String, Object> ogAplMapPut = new HashMap<String, Object>();
			ogAplMapPut.put("aplId", db.getAplBean().get(i).getAplId());
			ogAplMapPut.put("aplName", db.getAplBean().get(i).getAplName());
			ogAplMap.add(ogAplMapPut);
		}
		
		for(int i=apSeqLoc; i<db.getAplBean().size(); i++) {
			Map<String, Object> ogDocMapPut = new HashMap<String, Object>();
			ogDocMapPut.put("aplId", db.getAplBean().get(i).getAplId());
			ogDocMapPut.put("aplName", db.getAplBean().get(i).getAplName());
			ogDocMap.add(ogDocMapPut);
		}
		
		try {
			ssn.setAttribute("ogAplMap", ogAplMap);
			ssn.setAttribute("ogDocMap", ogDocMap);
			ssn.setAttribute("ogRefMap", ogRefMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}

	public ModelAndView mConfirmDraft(DocumentBean db) {
		mav = new ModelAndView();
		
		System.out.println(db);
		
		List<DocumentBean> tempList = null;
		String dmCodeCheck = null;
		
		List<Map<String, Object>> aplMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> docMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> refMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> apDpMap = new ArrayList<Map<String, Object>>();

		int apSeqLoc = db.getAplSeq() + 1;
		
		for(int i=0; i<db.getRfBean().size(); i++) {
			Map<String, Object> refMapPut = new HashMap<String, Object>();
			refMapPut.put("rdId", db.getRfBean().get(i).getRdId());
			refMapPut.put("rdName", db.getRfBean().get(i).getRdName());
			refMapPut.put("rfSeq", i+1);
			refMap.add(refMapPut);
		}
		
		for(int i=1; i<apSeqLoc; i++) {
			Map<String, Object> aplMapPut = new HashMap<String, Object>();
			
			db.setApId(db.getAplBean().get(i).getAplId());
			String grSession = sqlSession.selectOne("selGrInfo", db);
			String dpSession = sqlSession.selectOne("selDpInfo", db);
			
			aplMapPut.put("aplId", db.getAplBean().get(i).getAplId());
			aplMapPut.put("aplName", db.getAplBean().get(i).getAplName());
			aplMapPut.put("aplSeq", i);
			aplMapPut.put("aplGrade", grSession);
			aplMapPut.put("aplDpName", dpSession);
			aplMap.add(aplMapPut);
			
			// 결재선에서 불러와줄 Map
			apDpMap.add(aplMapPut);
		}
		
		for(int i=apSeqLoc; i<db.getAplBean().size(); i++) {
			Map<String, Object> docMapPut = new HashMap<String, Object>();
			
			db.setApId(db.getAplBean().get(i).getAplId());
			String grSession = sqlSession.selectOne("selGrInfo", db);
			String dpSession = sqlSession.selectOne("selDpInfo", db);
			
			docMapPut.put("aplId", db.getAplBean().get(i).getAplId());
			docMapPut.put("aplName", db.getAplBean().get(i).getAplName());
			docMapPut.put("aplSeq", i);
			docMapPut.put("aplGrade", grSession);
			docMapPut.put("aplDpName", dpSession);
			
			docMap.add(docMapPut);
			
			// 결재선에서 불러와줄 Map
			apDpMap.add(docMapPut);
		}
		
		try {
			db.setDmWriteId((String) ssn.getAttribute("userId"));
			db.setCmCode((String) ssn.getAttribute("cmCode"));

			sqlSession.insert("insTemporary", db);
			tempList = sqlSession.selectList("selTemporary", db);
			dmCodeCheck = sqlSession.selectOne("selDmCode", db);

			ssn.setAttribute("tempList", tempList);
			ssn.setAttribute("dmCheck", dmCodeCheck);
			ssn.setAttribute("docBean", db);
			ssn.setAttribute("aplMap", aplMap);
			ssn.setAttribute("apDpMap", apDpMap);
			ssn.setAttribute("docMap", docMap);
			ssn.setAttribute("refMap", refMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return mav;
	}

	public List<DocumentBean> mModifyDraft(DocumentBean db) {
		List<DocumentBean> docList = null;
		
		List<Map<String, Object>> aplMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> docMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> refMap = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> apDpMap = new ArrayList<Map<String, Object>>();

		int apSeqLoc = db.getAplSeq() + 1;
		
		for(int i=0; i<db.getRfBean().size(); i++) {
			Map<String, Object> refMapPut = new HashMap<String, Object>();
			refMapPut.put("rdId", db.getRfBean().get(i).getRdId());
			refMapPut.put("rdName", db.getRfBean().get(i).getRdName());
			refMap.add(refMapPut);
		}
		
		for(int i=1; i<apSeqLoc; i++) {
			Map<String, Object> aplMapPut = new HashMap<String, Object>();
			
			db.setApId(db.getAplBean().get(i).getAplId());
			String grSession = sqlSession.selectOne("selGrInfo", db);
			String dpSession = sqlSession.selectOne("selDpInfo", db);
			
			aplMapPut.put("aplId", db.getAplBean().get(i).getAplId());
			aplMapPut.put("aplName", db.getAplBean().get(i).getAplName());
			aplMapPut.put("aplGrade", grSession);
			aplMapPut.put("aplDpName", dpSession);
			aplMap.add(aplMapPut);
			
			// 문서종류 및 결재선 수정시 결재자 정보를 저장할 Map
			apDpMap.add(aplMapPut);
		}
		
		for(int i=apSeqLoc; i<db.getAplBean().size(); i++) {
			Map<String, Object> docMapPut = new HashMap<String, Object>();
			db.setApId(db.getAplBean().get(i).getAplId());
			String grSession = sqlSession.selectOne("selGrInfo", db);
			String dpSession = sqlSession.selectOne("selDpInfo", db);
			
			docMapPut.put("aplId", db.getAplBean().get(i).getAplId());
			docMapPut.put("aplName", db.getAplBean().get(i).getAplName());
			docMapPut.put("aplGrade", grSession);
			docMapPut.put("aplDpName", dpSession);
			
			docMap.add(docMapPut);
			
			// 문서종류 및 결재선 수정시 결재자 정보를 저장할 Map
			apDpMap.add(docMapPut);
		}
		
		try {
			db.setDmWriteId((String) ssn.getAttribute("userId"));
			db.setCmCode((String) ssn.getAttribute("cmCode"));

			sqlSession.update("upTemporary", db);
			docList = sqlSession.selectList("selTemporary", db);

			ssn.setAttribute("tempList", docList);
			ssn.setAttribute("docBean", db);
			ssn.setAttribute("aplMap", aplMap);
			ssn.setAttribute("docMap", docMap);
			ssn.setAttribute("apDpMap", apDpMap);
			ssn.setAttribute("refMap", refMap);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return docList;
	}
	
	public boolean uploadFile(MultipartFile[] uploadFiles) throws IOException {
		Map<String, Object> fileMap = new HashMap<String, Object>();
		
		for (MultipartFile multipartFile : uploadFiles) {
			try {
				//String fileName = "" + generateFileName(multipartFile);
				String fileName = multipartFile.getOriginalFilename();
				String fileLoc = uploadPath + multipartFile.getOriginalFilename();
				File tmp = new File(uploadPath + fileName);

				fileMap.put("fileName", fileName);
				fileMap.put("fileSize", multipartFile.getSize());
				multipartFile.transferTo(tmp);
				ssn.setAttribute("fileLoc", fileLoc);
				System.out.println(ssn.getAttribute("fileLoc"));
				// sqlSession.insertFiles(fileMap);
			} catch (Exception e) {
				System.out.println("Error");
				return false;
			}
		}
		
		return true;
	}
	
	public boolean uploadSign(MultipartFile[] uploadSigns) throws IOException {
		Map<String, Object> signMap = new HashMap<String, Object>();
		
		for (MultipartFile multipartFile : uploadSigns) {
			try {
				//String fileName = "" + generateFileName(multipartFile);
				String fileName = ssn.getAttribute("userId") + ".png";
				String signLoc = signPath + fileName;
				File tmp = new File(signPath + fileName);

				signMap.put("fileName", fileName);
				signMap.put("fileSize", multipartFile.getSize());
				multipartFile.transferTo(tmp);
				ssn.setAttribute("signLoc", signLoc);
			} catch (Exception e) {
				System.out.println("Error");
				return false;
			}
		}
		
		return true;
	}
	
	private String generateFileName(MultipartFile multipartFile) {
        Calendar cal=Calendar.getInstance();
        Date date=cal.getTime();
        String fileName=new SimpleDateFormat("yyyyMMdd").format(date)+"_"+multipartFile.getOriginalFilename();
        return fileName;
    }
	
	public List<WriteBean> mRequestDraft(WriteBean wb) {
		List<WriteBean> writeList = new ArrayList<WriteBean>();
		writeList.add(wb);
		
		int aplineSize = wb.getAplBean().size();
		int rflineSize = wb.getRefBean().size();
		
		try {
			wb.setCmCode((String) ssn.getAttribute("cmCode"));
			wb.setFileLoc((String) ssn.getAttribute("fileLoc"));
			wb.setSignLoc((String) ssn.getAttribute("signLoc"));
			
			System.out.println(ssn.getAttribute("aplMap"));
			System.out.println(ssn.getAttribute("docMap"));
			System.out.println(ssn.getAttribute("refMap"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println(wb);
		
		if(this.convertToBoolean(sqlSession.insert("insDocument", wb))) {
			sqlSession.delete("delTemporary", wb);
			if(this.convertToBoolean(sqlSession.insert("insApprovalComment", wb))) {
				for(int i=0; i<aplineSize; i++) {
					wb.setDmWriter(wb.getAplBean().get(i).getAplId());
					wb.setAplSeq(wb.getAplBean().get(i).getAplSeq()+1);
					
					sqlSession.insert("insApprovalOther", wb);
				}
				if(rflineSize > 0) {
					for(int i=0; i<rflineSize; i++) {
						wb.setRefId(wb.getRefBean().get(i).getRdId());
						
						sqlSession.insert("insReference", wb);
					}
				} else {
					System.out.println("Reference Line is not found");
				}
				System.out.println("Success");
			}
		} else {
			System.out.println("Error");
		}
		
		return writeList;
	}
	
	public List<DocumentBean> mTempRemove(DocumentBean db) {
		List<DocumentBean> docList = null;
		
		docList = null;
		
		return docList;
	}

	public ModelAndView mDraftPage(DocumentBean db) {
		mav = new ModelAndView();

		mav.setViewName("redirect:/");

		return mav;
	}

	private String getToday() {
		LocalDate today = LocalDate.now();
		return today.plusDays(1).toString();
	}

	private void handleNullValues(DocumentBean db) {
		if(db.getDmNum().isEmpty()) {
			db.setDmNum("");
		}
		if(db.getDmTitle().isEmpty()) {
			db.setDmTitle("");
		}
		if(db.getDmCode().isEmpty()) {
			db.setDmCode("");
		}
		if(db.getDmDate().isEmpty()) {
			db.setDmDate("0001-01-01");
		}
		if(db.getDmDate2().isEmpty()) {
			db.setDmDate2(this.getToday());
		}
	}
	
	private void changeDateFormat(DocumentBean db) {
		try {
			db.setDmDate(db.getDmDate().replaceAll("-", ""));
			db.setDmDate2(db.getDmDate2().replaceAll("-", ""));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	public ModelAndView documentBoxDetail(DocumentBean db) {
		
		ModelAndView mav = new ModelAndView();
		try {
			db.setApId((String)ssn.getAttribute("userId"));
			db.getDmNumCheck();
		} catch (Exception e) {
		
			e.printStackTrace();
		}
		
		
		mav.addObject("title",db.getDmTitle());
		//이거 그냥 위에서 dmNum으로 저장해두 됨. 헷갈릴수도 있으니 일단 다른걸로 저장.
		mav.addObject("title",db.getDmNumCheck());
		mav.addObject("dmDate",db.getDmDate());
		mav.addObject("dmWriteId",db.getDmWriteId());
		mav.addObject("dmRefId",db.getRefId());
		mav.addObject("dmCode",db.getDmCode());
		
		//DOCUMENT,APPROVALLINE,APCOMMENT(결재의견) ,COMMENT(그냥의견 이건 완료문서함에 한해서),REF,READING,
		
		
		
		//결재선에 있는 사람들 (부서포함) , 사인 파일 위치,   AL테이블 
		
		
		//dm테이블에 있는 문서(jpg)에 관한 파일 위치  DM테이블
		
		
		
		//REF,READING아이디는 REF테이블,READING테이블에있음
		
	
	
		
		
		mav.setViewName("document/documentBox");
		
		
		return mav;
	}
	
	private boolean convertToBoolean(int result) {
		return result==1 ? true: false;  
	}

}