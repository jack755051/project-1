export const getComments = async ()=>{
    return[
            {
                id:"1", 
                userName: 'Jane Cooper',
                userId:'1',
                comment: '賽博龐克的風格很棒，我很喜歡',
                parentId:null,
                createdAt: '2021-08-16T23:00:11.010+02:00',
                image:
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60',
            },
            {
                id:"2", 
                userName: 'Jack Shesje',
                userId:'2',
                comment: '不知道賽博龐克2077哪時候發行',
                parentId:null,
                createdAt: '2021-08-17T00:00:09.010+02:00',
                image:
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixid=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60',
            },
            {
                id:"3", 
                userName: 'Jane Cooper',
                userId:'1',
                comment: '可能今年11月',
                parentId:'2',  
                createdAt: '2021-08-17T00:05:55.010+02:00',
                image:
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60',
            },
            {
                id:"4", 
                userName: 'Mertioa Ken',
                userId:'3',
                comment: '相較於賽博龐克我更愛蒸氣龐克的魔幻',
                parentId:null,
                createdAt: '2021-08-17T01:00:21.010+02:00',
                image:
                'https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixid=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60',
            },
            {
                id:"5", 
                userName: 'Cocoail B',
                userId:'4',
                comment: '超期待賽博龐克2077',
                parentId:null,
                createdAt: '2021-08-17T05:22:00.010+02:00',
                image:
                'https://images.unsplash.com/photo-1547425260-76bcadfb4f2c?ixid=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60',
            },
            {
                id:"6", 
                userName: 'Gina Fia',
                userId:'5',
                comment: '但我不喜歡真人版Ghost in the Shell',
                parentId:null,
                createdAt: '2021-08-17T10:05:24.010+02:00',
                image:
                'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60',
            }, 
    ]
}
export const createComment = async (text, parentId = null) => {
    return {
      id: Math.random().toString(36).substr(2, 9),
      comment: text,
      parentId,
      userId: "1",
      userName: "John",
      createdAt: new Date().toISOString(),
      image:
        'https://images.unsplash.com/photo-1555952517-2e8e729e0b44?ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=facearea&facepad=4&w=256&h=256&q=60',
    };
  };
  
  export const updateComment = async (text) => {
    return { text };
  };
  
  export const deleteComment = async () => {
    return {};
  };
