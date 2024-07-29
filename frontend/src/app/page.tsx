import Image from "next/image";
import Button from "@/components/Button";
import SideBar from "@/components/side_bar";

export default function Home() {
    return (
        <>
            <div className="w-full h-screen flex">
                <SideBar highlight={1}/>
                <div className={"w-5/6 h-full flex justify-center items-center border"}>
                    <div className={"w-1/3 h-1/2 flex flex-col justify-center"}>
                        <div className={"py-10"}>
                            <h1  className={"text-2xl font-bold"}>Complete your setup</h1>
                            <p className={"text-lg"}>Follow this quick guide to maximize your Evernote experience.</p>
                        </div>
                        <div className={""}>

                        </div>
                        <Button text={"Get Started"}/>
                    </div>
                </div>
            </div>
        </>
    );
}
