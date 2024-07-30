"use client"
import Button from "@/components/Button";
import SideBar from "@/components/side_bar";
import Image_upload from "@/components/image_upload";
import {useMutation, useQuery} from "react-query";
import fetcher from "@/utils/fetcher";
import {useState} from "react";
import {router} from "next/client";
import {useRouter} from "next/navigation";

const Page = () => {
    const router = useRouter()
    const [data,setData] = useState<addNotes>({
        description: "",
        title: ""
    })
    const mutation = useMutation(() =>
        fetcher({ queryKey: ['notes', 'http://localhost:8000/note/add-note'], method: 'POST', body: data })
    );

    const submitData = () => {
        mutation.mutate();
        router.push('/')
    };
    return (
        <div className="w-full h-screen flex">
            <SideBar highlight={0} />
            <div className="w-5/6 h-full flex justify-center items-center">
                <div className="w-11/12">
                    <div className="flex justify-between">
                        <div>
                            <p>Ready to start taking notes?</p>
                            <h1 className="text-2xl font-bold">Add a Note</h1>
                        </div>
                        <Button text="Share" />
                    </div>
                    <div className="py-4">
                        <div className="py-2">
                            <p className="text-lg py-2 font-bold tracking-wide">Title</p>
                            <input
                                placeholder="Write title here..."
                                name={"title"}
                                value={data.title}
                                onChange={(e)=> {
                                    setData({
                                        ...data,
                                        title:e.target.value
                                    })
                                }}
                                className="w-1/2 py-4 px-4 rounded-lg border-black border"
                            />
                        </div>
                        <div className="py-2">
                            <p className="text-lg py-2 font-bold tracking-wide">Description</p>
                            <textarea
                                placeholder="Write description here...."
                                name={"description"}
                                value={data.description}
                                onChange={(e)=>{
                                    setData({
                                        ...data,
                                        description:e.target.value
                                    })
                                }}
                                className="border-black border rounded-lg w-1/2 p-4 min-h-[200px]"
                            />
                        </div>
                        <div className="py-2">
                            <p className="text-lg py-2 font-bold tracking-wide">Attachment</p>
                            <Image_upload/>
                        </div>
                    </div>
                    <Button text="Add" submitData={submitData} />
                </div>
            </div>
        </div>
    );
};

export default Page;
