import api from "./axios";

export const getMajors = async () => {
    const response = await api.get("/majors");  //API call to the backend to get majors 
    return response.data;
};


export const getQuestions = async () => {
    const response = await api.get("/questions");
    return response.data;
};

export const getWeights = async () => {
    const response = await api.get("/weights");
    return response.data;
};