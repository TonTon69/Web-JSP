package model;

import java.sql.Timestamp;

public class UserQuiz {

    private int userquizID;
    private int userID;
    private int quizID;
    private float score;
    private int totalAnswerTrue;
    private Timestamp startTime;
    private Timestamp endTime;
    private Timestamp startDay;
    private Timestamp endDay;

    public UserQuiz() {
    }

    public UserQuiz(int userquizID, int userID, int quizID, float score, int totalAnswerTrue, Timestamp startTime, Timestamp endTime, Timestamp startDay, Timestamp endDay) {
        this.userquizID = userquizID;
        this.userID = userID;
        this.quizID = quizID;
        this.score = score;
        this.totalAnswerTrue = totalAnswerTrue;
        this.startTime = startTime;
        this.endTime = endTime;
        this.startDay = startDay;
        this.endDay = endDay;
    }

    public int getUserquizID() {
        return userquizID;
    }

    public void setUserquizID(int userquizID) {
        this.userquizID = userquizID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getQuizID() {
        return quizID;
    }

    public void setQuizID(int quizID) {
        this.quizID = quizID;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public int getTotalAnswerTrue() {
        return totalAnswerTrue;
    }

    public void setTotalAnswerTrue(int totalAnswerTrue) {
        this.totalAnswerTrue = totalAnswerTrue;
    }

    public Timestamp getStartTime() {
        return startTime;
    }

    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return endTime;
    }

    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Timestamp getStartDay() {
        return startDay;
    }

    public void setStartDay(Timestamp startDay) {
        this.startDay = startDay;
    }

    public Timestamp getEndDay() {
        return endDay;
    }

    public void setEndDay(Timestamp endDay) {
        this.endDay = endDay;
    }
    
}
