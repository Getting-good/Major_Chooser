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

export const createQuestions = async (questions) => {
    const response = await api.post("/questions", questions);
    return response.data;
}

export const updateQuestions = async (questionId, updatedQuestion) => {
    const response = await api.put(`/questions/${questionId}`, updatedQuestion);
    return response.data;
}

export const deleteQuestions = async (questionId) => {
    const response = await api.delete(`/questions/${questionId}`);
    return response.data;
}

export const updateWeights = async (weightId, updatedWeight) => {
    const response = await api.put(`/weights/${weightId}`, updatedWeight);
    return response.data;
}