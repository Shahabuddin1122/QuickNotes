import axios from "axios";

const fetcher = async ({ queryKey, method = 'GET', body = null }) => {
    const [_key, url] = queryKey;

    let response;
    switch (method) {
        case 'GET':
            response = await axios.get(url);
            break;
        case 'POST':
            response = await axios.post(url, body);
            break;
        case 'PUT':
            response = await axios.put(url, body);
            break;
        default:
            throw new Error(`Unsupported method: ${method}`);
    }

    return response.data;
};

export default fetcher;
