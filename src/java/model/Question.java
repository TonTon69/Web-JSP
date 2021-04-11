package model;

import java.sql.Timestamp;

public class Question {

    private int questionID;
    private int subjectID;
    private int quizID;
    private String content;
    private String qA;
    private String qB;
    private String qC;
    private String qD;
    private String qTrue;
    private int level;
    private String image;
    private String audio;
    private Timestamp createdate;

    public Question() {
    }

    public Question(int questionID, int subjectID, int quizID, String content, String qA, String qB, String qC, String qD, String qTrue, int level, String image, String audio, Timestamp createdate) {
        this.questionID = questionID;
        this.subjectID = subjectID;
        this.quizID = quizID;
        this.content = content;
        this.qA = qA;
        this.qB = qB;
        this.qC = qC;
        this.qD = qD;
        this.qTrue = qTrue;
        this.level = level;
        this.image = image;
        this.audio = audio;
        this.createdate = createdate;
    }

    public Question(int subjectID, String content, String qA, String qB, String qC, String qD, String qTrue, int level, String image, String audio, Timestamp createdate) {
        this.subjectID = subjectID;
        this.content = content;
        this.qA = qA;
        this.qB = qB;
        this.qC = qC;
        this.qD = qD;
        this.qTrue = qTrue;
        this.level = level;
        this.image = image;
        this.audio = audio;
        this.createdate = createdate;
    }

    public Question(int subjectID, String content, String qA, String qB, String qC, String qD, String qTrue, Timestamp createdate) {
        this.subjectID = subjectID;
        this.content = content;
        this.qA = qA;
        this.qB = qB;
        this.qC = qC;
        this.qD = qD;
        this.qTrue = qTrue;
        this.createdate = createdate;
    }

    public Question(int questionID, int subjectID, String content, String qA, String qB, String qC, String qD, String qTrue, int level, String image, String audio, Timestamp createdate) {
        this.questionID = questionID;
        this.subjectID = subjectID;
        this.content = content;
        this.qA = qA;
        this.qB = qB;
        this.qC = qC;
        this.qD = qD;
        this.qTrue = qTrue;
        this.level = level;
        this.image = image;
        this.audio = audio;
        this.createdate = createdate;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public int getSubjectID() {
        return subjectID;
    }

    public void setSubjectID(int subjectID) {
        this.subjectID = subjectID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getqA() {
        return qA;
    }

    public void setqA(String qA) {
        this.qA = qA;
    }

    public String getqB() {
        return qB;
    }

    public void setqB(String qB) {
        this.qB = qB;
    }

    public String getqC() {
        return qC;
    }

    public void setqC(String qC) {
        this.qC = qC;
    }

    public String getqD() {
        return qD;
    }

    public void setqD(String qD) {
        this.qD = qD;
    }

    public String getqTrue() {
        return qTrue;
    }

    public void setqTrue(String qTrue) {
        this.qTrue = qTrue;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio;
    }

    public Timestamp getCreatedate() {
        return createdate;
    }

    public void setCreatedate(Timestamp createdate) {
        this.createdate = createdate;
    }

}
