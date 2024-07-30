"use client"
import SideBar from "@/components/side_bar";
import {useState} from "react";
import Note_card from "@/components/note_card";
import {useQuery} from "react-query";
import fetcher from "@/utils/fetcher";

const Page = () => {
    const [toggleButton,setToggleButton] = useState<number>(0)
    const { data, isLoading, error } = useQuery(['notes', 'http://localhost:8000/note/get-notes'], fetcher);
    console.log(data)
  return (
      <>
          <div className={"w-full h-screen flex"}>
              <SideBar highlight={2}/>
              <div className={"w-5/6 h-full flex justify-center items-center"}>
                  <div className={"w-11/12 h-[90%]"}>
                      <div>
                          <p>Ready to start taking notes?</p>
                          <h1 className="text-3xl font-bold">Shahabuddin&apos;s notes</h1>
                      </div>
                      <div className="py-8">
                          <div className={"flex justify-between items-center"}>
                              <h1 className={"font-bold text-2xl"}>Notes</h1>
                              <div className={"flex gap-x-4"}>
                                  <div className={`py-2 px-4 ${toggleButton == 0 ? 'bg-gray-300':''} border flex justify-center items-center rounded-md cursor-pointer`} onClick={()=> setToggleButton(0)}> Recent </div>
                                  <div className={`py-2 px-4 ${toggleButton == 1 ? 'bg-gray-300':''} border flex justify-center items-center rounded-md cursor-pointer`} onClick={()=> setToggleButton(1)}> Highlighted </div>
                              </div>
                          </div>
                      </div>
                      <div className={"w-full flex gap-10 flex-wrap justify-center"}>
                          {data && data.map((value,index)=>(
                              <Note_card key={index} title={value.title} description={value.description} favorite={value.favorite} date={value.formatted_date} />
                          ))}
                      </div>
                  </div>
              </div>
          </div>
      </>
  )
}
export default Page;